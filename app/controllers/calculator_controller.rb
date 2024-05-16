# app/controllers/calculator_controller.rb

class CalculatorController < ApplicationController
  # Controller action to add numbers provided as a string
  def add
    # Get numbers from request parameters or set an empty string if not provided
    numbers = params[:numbers] || ''
    # Get delimiter from request parameters or set ',' as the default delimiter
    delimiter = params[:delimiter] || ','
    # Extract numbers from the input string using the specified delimiter
    numbers_array = extract_numbers(numbers, delimiter)

    # Check if there are any negative numbers in the extracted numbers array
    negatives = find_negative_numbers(numbers_array)
    if negatives.any?
      # If negative numbers are found, render an error response
      render_negative_numbers_error(negatives)
    else
      # If no negative numbers are found, calculate the sum of the numbers and render a success response
      render json: { result: calculate_sum(numbers_array) }
    end
  end

  private

  # Method to extract numbers from the input string using the specified delimiter
  def extract_numbers(input, delimiter)
    # Construct a regular expression pattern to split the input string based on the delimiter
    delimiter_regex = Regexp.union(delimiter.split('][').map { |d| Regexp.escape(d.tr('[', '').tr(']', '')) })
    # Split the input string using the delimiter regex and convert the resulting strings to integers
    input.split(/#{delimiter_regex}|\n/).map(&:to_i)
  end

  # Method to find negative numbers in the given numbers array
  def find_negative_numbers(numbers_array)
    # Select negative numbers from the array
    numbers_array.select(&:negative?)
  end

  # Method to render an error response for negative numbers
  def render_negative_numbers_error(negatives)
    # Construct an error message with the negative numbers found
    error_message = "Negative numbers not allowed: #{negatives.join(', ')}"
    # Render a JSON response with the error message and status code :unprocessable_entity
    render json: { error: error_message }, status: :unprocessable_entity
  end

  # Method to calculate the sum of numbers in the given array
  def calculate_sum(numbers_array)
    # Calculate the sum using the `sum` method of the array
    numbers_array.sum
  end
end
