# frozen_string_literal: true

module SmartAssist
  module Actions
    module Webhook
      class Post < SmartAssist::Action
        include Deps[
          :line_bot,
          'queries.chat.suggest'
        ]

        before :verify_signature

        def handle(req, res)
          body = req.body.read
          events = line_bot.parse_events_from(body)

          events.each(&method(:resolve_event))

          res.format = :json
          res.body = { status: 'ok' }.to_json
        end

        private

        def verify_signature(req, _res)
          signature = req.get_header('HTTP_X_LINE_SIGNATURE')
          body = req.body.read
          halt 400, 'Bad Request' unless line_bot.validate_signature(body, signature)
        ensure
          req.body.rewind
        end

        def resolve_event(event)
          case event
          when Line::Bot::Event::Message
            case event.type
            when Line::Bot::Event::MessageType::Text
              text = event.message['text']
              suggest.call(text, reply_token: event['replyToken'])
            end
          end
        end
      end
    end
  end
end
