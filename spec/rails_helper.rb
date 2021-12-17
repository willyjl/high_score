require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

FactoryBot.find_definitions

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
end

def user_format(with_scores = false)
  {
    'id' => be_a_kind_of(Integer),
    'username' => be_a_kind_of(String),
    'highest_score' => (be_a_kind_of(Float).or be_nil ),
    'average_score' => (be_a_kind_of(Float).or be_nil ),
    'lowest_score' => (be_a_kind_of(Float).or be_nil ),
    'created_at' => be_a_kind_of(String),
    'updated_at' => be_a_kind_of(String),
  }.merge(
    with_scores ? {
      'scores' => (
        include(score_format).or match_array([])
      )
    } : {}
  )
end

def score_format
  {
    'id' => be_a_kind_of(Integer),
    'point' => be_a_kind_of(Float),
    'created_at' => be_a_kind_of(String),
    'updated_at' => be_a_kind_of(String),
    'user_id' => be_a_kind_of(Integer),
  }
end

def parsed_response
  JSON.parse(response.body)
end