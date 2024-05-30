# frozen_string_literal: true

require 'hanami/cucumber'
require 'simplecov'

SimpleCov.start

BeforeAll do
  Hanami.boot
end
