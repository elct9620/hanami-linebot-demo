# frozen_string_literal: true

module SmartAssist
  class Routes < Hanami::Routes
    post '/webhook', to: 'webhook.post'
  end
end
