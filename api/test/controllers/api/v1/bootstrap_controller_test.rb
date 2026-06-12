require "test_helper"

class Api::V1::BootstrapControllerTest < ActionDispatch::IntegrationTest
  test "returns prototype bootstrap data" do
    get api_v1_bootstrap_url

    assert_response :success
    body = JSON.parse(response.body)
    assert body.fetch("roles").any? { |role| role.fetch("name") == "participant" }
    assert body.fetch("users").any? { |user| user.fetch("email") == "malia.santos@example.test" }
    assert body.fetch("plan_rules").any? { |rule| rule.fetch("employer_name") == "Bank of Mila" }
    assert body.fetch("knowledge_entries").any? { |entry| entry.fetch("category") == "401k_loans" }
  end
end
