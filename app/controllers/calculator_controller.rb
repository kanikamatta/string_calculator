# app/controllers/calculator_controller.rb

class CalculatorController < ApplicationController
  def add
    numbers = params[:numbers] || ""
    numbers_array = numbers.split(",").map(&:to_i)
    result = numbers_array.sum
    render json: { result: result }
  end
end
