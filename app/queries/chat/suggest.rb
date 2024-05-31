# frozen_string_literal: true

module SmartAssist
  module Queries
    module Chat
      class Suggest < SmartAssist::Query
        include Deps[
          :line_bot,
          :aotoki_ai
        ]

        def call(text, reply_token:)
          suggestion = suggest(text)

          line_bot.reply_message(reply_token, { type: 'text', text: suggestion.message })
        end

        private

        def suggest(text)
          Async { aotoki_ai.suggest(text) }.wait
        end
      end
    end
  end
end
