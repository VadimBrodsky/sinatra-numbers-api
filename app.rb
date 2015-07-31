require 'sinatra'
require 'json'
require_relative 'numbers.rb'

get '/:number' do
  content_type :json
  number = params[:number].to_i
  { number: number, factors: number.factors, odd: number.odd?,
    even: number.even?, prime: number.prime? }.to_json
end
