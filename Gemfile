####################
# BEGIN:initial gems
####################

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

##############################################
# BEGIN: gems that take a long time to install
##############################################
# Please pre-install the proper versions in the Docker image.
gem 'ffi', '1.11.1'
gem 'nokogiri', '1.10.3'
gem 'pg', '1.1.4'
gem 'rails', '5.2.3'
############################################
# END: gems that take a long time to install
############################################

# BEGIN: SQLite
# NOTE: This section is automatically deleted by the pg_setup.rb script
group :development, :test do
  gem 'sqlite3', '1.4.1'
end
# END: SQLite

# Use Puma as the app server
gem 'puma', '3.12.1'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.1.20'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.2.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.9.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '3.7.0'
  gem 'listen', '3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '3.22.0'
  gem 'selenium-webdriver', '3.142.3'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'webdrivers', '4.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# NOTE: tzinfo-data is not installed under the Ruby on Racetracks system
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

###################
# END: initial gems
###################

# BEGIN: gems for test_code.sh
group :development, :testing do
  gem 'brakeman', '4.5.1'
  gem 'bundler-audit', '0.6.1'
  gem 'gemsurance', '0.9.0'
  gem 'rails_best_practices', '1.19.4'
  gem 'rubocop', '0.71.0' # Checks for violations of the Ruby Style Guide, not recommended for legacy apps
  gem 'sandi_meter', '1.2.0'
end
# END: gems for test_code.sh

# Minitest
gem 'minitest', '5.11.3', require: false, group: :testing
gem 'minitest-reporters', '1.3.6', require: false, group: :testing # Adds special features to tests

# BEGIN: Capybara enhancements
group :test do
  gem 'capybara-email', '3.0.1'
  gem 'capybara-slow_finder_errors', '0.1.5'
end
# END: Capybara enhancements

# BEGIN: test coverage
gem 'simplecov', '0.16.1', require: false, group: :test
# END: test coverage

# BEGIN: gems used for setting up PostgreSQL in the development environment
# You do not need these gems if you use SQLite in the development environment.
# NOTE: Attempts to use "gem install" in the PostgreSQL setup scripts did not pan out.
gem 'figaro', '1.1.1'
gem 'line_containing', '0.1.2'
gem 'remove_double_blank', '0.0.0'
gem 'string_in_file', '1.0.2'
# END: gems used for setting up PostgreSQL in the development environment
