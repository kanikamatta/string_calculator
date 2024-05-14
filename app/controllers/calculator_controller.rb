# app/controllers/calculator_controller.rb

class CalculatorController < ApplicationController
  def add
    numbers = params[:numbers] || ""
    delimiter = params[:delimiter] || ","
    numbers_array = numbers.split(/#{delimiter}|\n/).map(&:to_i)
    result = numbers_array.sum
    render json: { result: result }
  end
end
