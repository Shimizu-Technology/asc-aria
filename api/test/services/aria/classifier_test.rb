require "test_helper"

class Aria::ClassifierTest < ActiveSupport::TestCase
  test "classifies account-specific loan question as participant specific" do
    result = Aria::Classifier.new("I work for Bank of Mila. How much can I borrow from my 401(k)?").call

    assert_equal "participant_specific", result.intent
    assert result.handoff_required
    assert_equal plan_rules(:bank_of_mila), result.matched_plan_rule
    assert_includes result.safety_flags, "requires_identity_or_account_verification"
  end

  test "classifies form questions as form routing" do
    result = Aria::Classifier.new("Where can I find the enrollment form?").call

    assert_equal "form_routing", result.intent
    assert_not result.handoff_required
  end

  test "classifies plan questions with seeded plan match" do
    result = Aria::Classifier.new("Does Bank of Mila allow retirement plan loans?").call

    assert_equal "plan_specific", result.intent
    assert_not result.handoff_required
    assert_equal plan_rules(:bank_of_mila), result.matched_plan_rule
  end

  test "general retirement questions include plan type knowledge" do
    result = Aria::Classifier.new("What types of 401(k) plans are there?").call

    assert_equal "general_education", result.intent
    assert_not result.handoff_required
    assert_includes result.knowledge_categories, "401k_plan_types"
    assert_includes result.knowledge_categories, "retirement_plan_basics"
  end

  test "classifies advice requests as high risk escalation" do
    result = Aria::Classifier.new("What fund should I invest in to guarantee returns?").call

    assert_equal "high_risk_escalation", result.intent
    assert result.handoff_required
  end
end
