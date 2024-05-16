# test/controllers/calculator_controller_test.rb

require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  # Test case for adding numbers: should return 0 for an empty string
  test 'should return 0 for an empty string' do
    post calculator_add_path, params: { numbers: '' }, as: :json
    assert_response :success
    assert_equal 0, JSON.parse(@response.body)['result']
  end

  # Test case for adding numbers: should handle new lines between numbers
  test 'should handle new lines between numbers' do
    post calculator_add_path, params: { numbers: "1\n2,3" }, as: :json
    assert_response :success
    assert_equal 6, JSON.parse(@response.body)['result']
  end

  # Test case for adding numbers: should support changing delimiters
  test 'should support changing delimiters' do
    post calculator_add_path, params: { numbers: "//;\n1;2;3", delimiter: ';' }, as: :json
    assert_response :success
    assert_equal 6, JSON.parse(@response.body)['result']
  end

  # Test case for adding numbers: should throw an error for negative numbers
  test 'should throw an error for negative numbers' do
    post calculator_add_path, params: { numbers: '-1,2,-3' }, as: :json
    assert_response :unprocessable_entity
    assert_equal 'Negative numbers not allowed: -1, -3', JSON.parse(@response.body)['error']
  end

  # Test case for adding numbers: should handle an empty string gracefully
  test 'should handle empty string gracefully' do
    post calculator_add_path, params: { numbers: '' }, as: :json
    assert_response :success
    assert_equal 0, JSON.parse(@response.body)['result']
  end

  # Test case for adding numbers: should handle multiple delimiters
  test 'should handle multiple delimiters' do
    post calculator_add_path, params: { numbers: "//[;][%]\n1;2%3", delimiter: '[;][%]' }, as: :json
    assert_response :success
    assert_equal 6, JSON.parse(@response.body)['result']
  end
end
