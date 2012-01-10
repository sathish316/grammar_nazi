require 'bundler/setup'
require 'rspec/mocks'
require 'checker'

RSpec.configure do |config|
  config.mock_with :mocha
end