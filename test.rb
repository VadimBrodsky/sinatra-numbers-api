ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative 'numbers.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end
