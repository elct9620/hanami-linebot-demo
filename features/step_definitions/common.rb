# frozen_string_literal: true

When('an event is sent to the webhook') do |payload|
  post '/webhook', payload, 'CONTENT_TYPE' => 'application/json'
end

Then('the response status code should be {int}') do |expected_code|
  expect(last_response.status).to eq(expected_code)
end
