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

  # Execute before each integration and controller test
  def setup
    setup_universal
  end

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

def login_user(str_login, str_pwd, status_remember)
  visit root_path
  click_on 'Login'
  fill_in('Login', with: str_login)
  fill_in('Password', with: str_pwd)
  if status_remember == true
    check('Remember me')
  else
    uncheck('Remember me')
  end
  click_button('Log in')
end

# Needed for using Devise tools in testing, such as login_as
include Warden::Test::Helpers

def edit_user_start(user1)
  login_as(user1, scope: :user)
  visit root_path
  click_on 'Edit Settings'
end

def xpath_input_str(str_input)
  str1 = './/input[@value="'
  str2 = str_input
  str3 = '"]'
  output = "#{str1}#{str2}#{str3}"
  output
end

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# Assign variables to test fixtures
# To be executed before each test
def setup_universal
  @a1 = admins(:elle_woods)
  @a2 = admins(:vivian_kensington)
  @a3 = admins(:emmett_richmond)
  @a4 = admins(:paulette_bonafonte)
  @a5 = admins(:professor_callahan)
  @a6 = admins(:warner_huntington)

  @u1 = users(:connery)
  @u2 = users(:lazenby)
  @u3 = users(:moore)
  @u4 = users(:dalton)
  @u5 = users(:brosnan)
  @u6 = users(:craig)
  @u7 = users(:blofeld)
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

def begin_user_password_reset(e)
  visit root_path
  click_on 'Login'
  click_on 'Forgot your password?'
  fill_in('Email', with: e)
  click_on 'Send me reset password instructions'
end
