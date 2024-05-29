# frozen_string_literal: true

module SmartAssist
  class Routes < Hanami::Routes
    post '/webhook', to: ->(_env) { [200, {}, ['ok']] }
  end
end
