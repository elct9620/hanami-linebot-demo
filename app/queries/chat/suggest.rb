# frozen_string_literal: true

module SmartAssist
  module Queries
    module Chat
      class Suggest < SmartAssist::Query
        include Deps[
          :aotoki_ai,
          :markdown
        ]

        def call(text)
          suggestion = suggest(text)
          text = markdown.render(suggestion.message).strip

          { type: 'text', text: }
        end

        private

        def suggest(text)
          Async { aotoki_ai.suggest(text) }.wait
        end
      end
    end
  end
end
