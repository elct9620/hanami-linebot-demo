# frozen_string_literal: true

Hanami.app.register_provider(:line_bot) do
  prepare do
    require 'line/bot'
  end

  start do
    register(:line_bot, Line::Bot::Client.new do |config|
                          config.channel_id = target[:settings].line_channel_id
                          config.channel_secret = target[:settings].line_channel_secret
                          config.channel_token = target[:settings].line_channel_token
                        end)
  end
end
