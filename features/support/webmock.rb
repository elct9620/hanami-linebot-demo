# frozen_string_literal: true

require 'webmock/cucumber'

module StubLineApi
  def line_reply_api = "#{Line::Bot::API::DEFAULT_ENDPOINT}/bot/message/reply"
end
World(StubLineApi)

module StubAotokiAiApi
  def aotoki_suggest_api = "#{AotokiAi::Client::ENDPOINT.to_url}v1/suggest"
end
World(StubAotokiAiApi)

Before do
  stub_request(:post, line_reply_api).to_return do |request|
    { body: request.body, status: 200 }
  end

  stub_request(:post, aotoki_suggest_api).to_return do |_request|
    {
      body: { success: true, data: { message: 'Yes, AI answer it!' } }.to_json,
      headers: { 'Content-Type' => 'application/json' },
      status: 200
    }
  end
end
