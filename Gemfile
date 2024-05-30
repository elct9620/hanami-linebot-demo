# frozen_string_literal: true

source 'https://rubygems.org'

gem 'hanami', '~> 2.1'
gem 'hanami-controller', '~> 2.1'
gem 'hanami-lambda'
gem 'hanami-router', '~> 2.1'
gem 'hanami-validations', '~> 2.1'

gem 'dry-types', '~> 1.0', '>= 1.6.1'
gem 'puma'
gem 'rake'

gem 'line-bot-api'

group :development do
  gem 'guard-puma'
  gem 'hanami-webconsole', '~> 2.1'

  gem 'ruby-lsp'
end

group :development, :test do
  gem 'dotenv'
end

group :cli, :development do
  gem 'hanami-reloader', '~> 2.1'
end

group :cli, :development, :test do
  gem 'hanami-cucumber'
  gem 'hanami-rspec', '~> 2.1'

  gem 'rubocop'
end

group :test do
  gem 'capybara'
  gem 'rack-test'
end
