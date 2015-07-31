ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative 'numbers.rb'
require_relative 'app.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'Numbers API' do

  it 'should return the factors of 6' do
    6.factors.must_equal [1, 2, 3, 6]
  end

  it 'should confirm that 2 is a prime' do
    assert 2.prime?
  end

  it 'should confirm that 10 is not a prime' do
    refute 10.prime?
  end

  it 'should return json data' do
    get '/8'
    last_response.headers['Content-Type'].must_equal 'application/json'
  end

  it 'should return the correct number info' do
    get '/6'
    six_info = { number:6, factors: 6.factors, odd: 6.odd?, even: 6.even?, prime: 6.prime?}
    six_info.to_json.must_equal last_response.body
  end
end
