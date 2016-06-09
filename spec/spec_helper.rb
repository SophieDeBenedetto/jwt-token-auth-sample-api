require 'rails_helper'
require 'rspec-rails'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Requests::JsonHelpers, type: :api
  config.expect_with :rspec do |expectations|
   
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.use_transactional_fixtures = false
  
  config.before :each do
    DatabaseCleaner.start
  end
  config.after :each do
    DatabaseCleaner.clean
  end
end
