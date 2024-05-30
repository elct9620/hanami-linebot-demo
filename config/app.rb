# frozen_string_literal: true

require 'hanami'
require 'hanami/lambda'

module SmartAssist
  class App < Hanami::App
    extend Hanami::Lambda::Application

    config.actions.format :json
  end
end
