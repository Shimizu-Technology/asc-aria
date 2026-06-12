require "test_helper"

class Api::V1::KnowledgeEntriesControllerTest < ActionDispatch::IntegrationTest
  test "lists active knowledge entries" do
    get api_v1_knowledge_entries_url

    assert_response :success
    body = JSON.parse(response.body)
    assert_equal 2, body.fetch("knowledge_entries").length
  end

  test "filters knowledge entries by category" do
    get api_v1_knowledge_entries_url, params: { category: "secure_support" }

    assert_response :success
    body = JSON.parse(response.body)
    entries = body.fetch("knowledge_entries")
    assert_equal 1, entries.length
    assert_equal "Account-specific escalation", entries.first.fetch("title")
  end
end
