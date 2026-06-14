require "test_helper"

class StaffAuthenticatableTest < ActiveSupport::TestCase
  class Harness
    include StaffAuthenticatable
  end

  test "staff sign-in touch skips recently seen accepted user" do
    user = users(:staff_user)
    user.update!(invitation_status: "accepted", accepted_at: 1.day.ago, last_sign_in_at: 1.minute.ago)

    replacement = lambda do |*_args, **_kwargs|
      raise "unexpected sign-in update"
    end

    with_replaced_method(user, :update!, replacement) do
      result = Harness.new.send(:mark_staff_sign_in_seen!, user)

      assert_equal user, result
    end
  end

  test "staff sign-in touch updates pending or stale user" do
    user = users(:staff_user)
    user.update!(invitation_status: "pending", accepted_at: nil, last_sign_in_at: 10.minutes.ago)

    result = Harness.new.send(:mark_staff_sign_in_seen!, user)

    assert_equal user, result
    user.reload
    assert_equal "accepted", user.invitation_status
    assert_not_nil user.accepted_at
    assert user.last_sign_in_at > 2.minutes.ago
  end

  test "Clerk linking recovers when a concurrent request already linked the same id" do
    user = users(:staff_user)
    clerk_id = "clerk_race_#{SecureRandom.hex(8)}"
    user.update!(clerk_id: nil)

    replacement = lambda do |*_args, &_block|
      user.update_columns(clerk_id: clerk_id, updated_at: Time.current)
      raise ActiveRecord::RecordNotUnique, "duplicate clerk_id"
    end

    with_replaced_method(user, :with_lock, replacement) do
      result = Harness.new.send(:link_clerk_id_if_needed, user, clerk_id)

      assert_equal user.id, result.id
      assert_equal clerk_id, result.clerk_id
    end
  end
end
