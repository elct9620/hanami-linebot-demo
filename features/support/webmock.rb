# frozen_string_literal: true

require 'webmock/cucumber'

module StubLineApi
  def line_reply_api = "#{Line::Bot::API::DEFAULT_ENDPOINT}/bot/message/reply"
end
World(StubLineApi)

Before do
  stub_request(:post, line_reply_api).to_return do |request|
    { body: request.body, status: 200 }
  end
end
