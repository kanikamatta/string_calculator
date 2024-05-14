# app/controllers/calculator_controller.rb

class CalculatorController < ApplicationController
  def add
    numbers = params[:numbers] || ""
    delimiter = params[:delimiter] || ","
    numbers_array = numbers.split(/#{delimiter}|\n/).map(&:to_i)
    
    negatives = numbers_array.select { |num| num < 0 }
    if negatives.any?
      render json: { error: "Negative numbers not allowed: #{negatives.join(', ')}" }, status: :unprocessable_entity
    else
      result = numbers_array.sum
      render json: { result: result }
    end
  end
end
