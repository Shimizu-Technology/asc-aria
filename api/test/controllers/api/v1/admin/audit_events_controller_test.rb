require "test_helper"

class Api::V1::Admin::AuditEventsControllerTest < ActionDispatch::IntegrationTest
  test "lists audit events" do
    get api_v1_admin_audit_events_url

    assert_response :success
    body = JSON.parse(response.body)
    assert body.fetch("audit_events").any? { |event| event.fetch("action") == "prototype_seeded" }
  end
end
