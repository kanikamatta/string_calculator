# test/controllers/calculator_controller_test.rb

require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should return 0 for an empty string" do
    post calculator_add_path, params: { numbers: "" }, as: :json
    assert_response :success
    assert_equal 0, JSON.parse(@response.body)["result"]
  end

  test "should handle new lines between numbers" do
    post calculator_add_path, params: { numbers: "1\n2,3" }, as: :json
    assert_response :success
    assert_equal 6, JSON.parse(@response.body)["result"]
  end
end
