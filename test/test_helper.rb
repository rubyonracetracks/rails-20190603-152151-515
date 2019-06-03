# BEGIN: SimpleCov
require 'simplecov'
SimpleCov.start :rails do
  add_filter '/app/controllers/users/omniauth_callbacks_controller.rb'
  add_filter '/test/'
  add_filter '/app/channels/application_cable/channel.rb'
  add_filter '/app/channels/application_cable/connection.rb'
  add_filter '/app/jobs/application_job.rb'
  add_filter '/app/mailers/application_mailer.rb'
end
# END: SimpleCov

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# BEGIN: use minitest-reporters
# NOTE: Minitest Reporters is incompatible with GitLab CI.
if ENV['GITLAB_CI'].nil?
  require 'minitest/reporters'
  require 'rake_rerun_reporter'
  Minitest::Reporters.use!

  reporter_options = { color: true, slow_count: 5, verbose: false, rerun_prefix: 'rm -f log/test.log && bundle exec' }
  Minitest::Reporters.use! [Minitest::Reporters::HtmlReporter.new,
                            Minitest::Reporters::RakeRerunReporter.new(reporter_options)]
end
# END: use minitest-reporters

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# BEGIN: Capybara setup
require 'capybara/rails'
require 'capybara/email'

# NOTE:
# The ActionDispatch::IntegrationTest class applies to
# integration tests AND controller tests.
class ActionDispatch::IntegrationTest
  # Make app/helpers/application_helper.rb available
  include ApplicationHelper

  # Make the Capybara DSL available
  include Capybara::DSL
  include Capybara::Email::DSL

  # Reset sessions and driver after each integration and controller test
  def teardown
    teardown_universal
  end
end
# END: Capybara setup

def teardown_universal
  Capybara.reset_sessions!
  Capybara.use_default_driver
end

def sign_up_user(name_u, name, e, p1, p2)
  visit root_path
  click_on 'Sign up now!'
  fill_in('Name', with: name)
  fill_in('Username', with: name_u)
  fill_in('Email', with: e)
  fill_in('Password', with: p1) # not yet changed
  fill_in('Password confirmation', with: p2)
  click_button('Sign up')
end
