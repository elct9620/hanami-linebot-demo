# frozen_string_literal: true

module SmartAssist
  module Actions
    module Webhook
      class Post < SmartAssist::Action
        include Deps[:line_bot]

        before :verify_signature

        def handle(req, res)
          body = req.body.read
          events = line_bot.parse_events_from(body)

          events.each do |event|
            line_bot.reply_message(event['replyToken'], { type: 'text', text: 'Hello, world!' })
          end

          res.body = 'ok'
        end

        private

        def verify_signature(req, _res)
          signature = req.get_header('HTTP_X_LINE_SIGNATURE')
          body = req.body.read
          halt 400, 'Bad Request' unless line_bot.validate_signature(body, signature)
        ensure
          req.body.rewind
        end
      end
    end
  end
end
