# frozen_string_literal: true

require 'async/rest'

module AotokiAi
  require_relative 'suggest'

  class Client < Async::REST::Resource
    ENDPOINT = Async::HTTP::Endpoint.parse('https://blog.aotoki.me/ai')

    def suggest(message, &)
      Suggest.post(with(path: '/v1/suggest'), message:, &)
    end
  end
end
