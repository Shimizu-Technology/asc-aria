require "test_helper"

class Api::V1::PlanRulesControllerTest < ActionDispatch::IntegrationTest
  test "lists active plan rules" do
    get api_v1_plan_rules_url

    assert_response :success
    body = JSON.parse(response.body)
    assert_equal 2, body.fetch("plan_rules").length
  end

  test "filters active plan rules by employer" do
    get api_v1_plan_rules_url, params: { employer_name: "Bank of Mila" }

    assert_response :success
    body = JSON.parse(response.body)
    rules = body.fetch("plan_rules")
    assert_equal 1, rules.length
    assert_equal "Bank of Mila 401(k)", rules.first.fetch("plan_name")
  end
end
