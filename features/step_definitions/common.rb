# frozen_string_literal: true

def signature(body, secret)
  hash = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secret, body)
  Base64.strict_encode64(hash)
end

When('an event is sent to the webhook') do |payload|
  post '/webhook', payload, 'CONTENT_TYPE' => 'application/json',
                            'HTTP_X_LINE_SIGNATURE' => signature(payload, app[:settings].line_channel_secret)
end

Then('the response status code should be {int}') do |expected_code|
  expect(last_response.status).to eq(expected_code)
end

Then('the reply message should be') do |payload|
  expect(a_request(:post, line_reply_api).with(body: JSON.parse(payload))).to have_been_made.once
end
