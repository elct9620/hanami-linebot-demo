# frozen_string_literal: true

module SmartAssist
  module Queries
    module Chat
      class Suggest < SmartAssist::Query
        include Deps[:line_bot]

        def call(text, reply_token:)
          line_bot.reply_message(reply_token, { type: 'text', text: })
        end
      end
    end
  end
end
