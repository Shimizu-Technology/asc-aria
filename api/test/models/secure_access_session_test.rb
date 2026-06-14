require "test_helper"

class SecureAccessSessionTest < ActiveSupport::TestCase
  setup do
    @directory_entry = ParticipantDirectoryEntry.create!(
      external_identifier: "SECURE-ACCESS-#{SecureRandom.hex(6)}",
      display_name: "Secure Access Demo",
      email: "secure-access-#{SecureRandom.hex(4)}@example.test",
      phone: "671-555-0188",
      employer_name: "Bank of Mila",
      plan_name: "Bank of Mila 401(k)",
      status: "active"
    )
    @handoff = HandoffToken.create!(intent: "participant_specific", topic: "401(k) loan eligibility")
  end

  test "expired treats revoked sessions as unusable while preserving status label" do
    session = SecureAccessSession.create!(
      participant_directory_entry: @directory_entry,
      handoff_token: @handoff,
      status: "revoked"
    )

    assert session.expired?
    assert_equal "revoked", session.effective_status
    assert_equal "revoked", session.as_api_json.fetch(:status)
  end

  test "expired active session reports expired effective status" do
    session = SecureAccessSession.create!(
      participant_directory_entry: @directory_entry,
      handoff_token: @handoff,
      expires_at: 1.minute.ago
    )

    assert session.expired?
    assert_equal "expired", session.effective_status
    assert_equal "expired", session.as_api_json.fetch(:status)
  end
end
