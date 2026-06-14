require "test_helper"

class SecureSupport::VerificationDeliveryTest < ActiveSupport::TestCase
  test "delivery persistence failure marks challenge failed so a retry is not suppressed" do
    participant = ParticipantDirectoryEntry.create!(
      external_identifier: "DELIVERY-FAILURE-#{SecureRandom.hex(6)}",
      display_name: "Delivery Failure Demo",
      email: "delivery-failure-#{SecureRandom.hex(4)}@example.test",
      phone: "671-555-0199",
      employer_name: "Bank of Mila",
      plan_name: "Bank of Mila 401(k)",
      status: "active"
    )
    handoff = HandoffToken.create!(intent: "participant_specific", topic: "401(k) loan eligibility")
    token = SecureRandom.urlsafe_base64(VerificationChallenge::TOKEN_BYTES)
    challenge = VerificationChallenge.create!(
      handoff_token: handoff,
      participant_directory_entry: participant,
      token: token,
      channel: "email",
      contact_digest: SecureSupport::Contact.digest("delivery-failure@example.test"),
      contact_masked: SecureSupport::Contact.mask_email("delivery-failure@example.test"),
      code_digest: VerificationChallenge.digest_code(token: token, code: "123456")
    )
    association = challenge.outbound_deliveries
    failure = lambda do |**_attrs|
      raise ActiveRecord::RecordInvalid.new(OutboundDelivery.new)
    end

    with_replaced_method(association, :create!, failure) do
      assert_raises(ActiveRecord::RecordInvalid) do
        SecureSupport::VerificationDelivery.deliver!(challenge: challenge, code: "123456", contact: "delivery-failure@example.test")
      end
    end

    assert_equal "failed", challenge.reload.status
    assert_empty challenge.outbound_deliveries
  end

  test "live sends require configured test contact allowlist" do
    with_env(
      "LIVE_VERIFICATION_EMAILS_ENABLED" => "true",
      "LIVE_VERIFICATION_ALLOWLIST_REQUIRED" => "true",
      "ASC_ARIA_TEST_PARTICIPANT_EMAIL" => "allowed@example.test",
      "LIVE_VERIFICATION_ALLOWED_EMAILS" => "other@example.test"
    ) do
      assert SecureSupport::VerificationDelivery.live_send_enabled?("email", contact: "allowed@example.test")
      assert SecureSupport::VerificationDelivery.live_send_enabled?("email", contact: "OTHER@example.test")
      assert_not SecureSupport::VerificationDelivery.live_send_enabled?("email", contact: "blocked@example.test")
    end
  end

  private

  def with_env(values)
    previous_values = values.keys.to_h { |key| [ key, ENV[key] ] }
    values.each { |key, value| ENV[key] = value }
    yield
  ensure
    previous_values.each do |key, value|
      value.nil? ? ENV.delete(key) : ENV[key] = value
    end
  end
end
