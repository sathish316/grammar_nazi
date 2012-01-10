require 'bundler/setup'
require 'rspec/mocks'
require 'grammar_validator'

RSpec.configure do |config|
  config.mock_with :mocha
end