# frozen_string_literal: true

module SmartAssist
  module Actions
    module Webhook
      class Post < SmartAssist::Action
        def handle(_req, res)
          res.body = 'ok'
        end
      end
    end
  end
end
