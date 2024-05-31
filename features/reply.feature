Feature: Reply Message

  Scenario: User send Hello World and receive reply
    When an event is sent to the webhook
    """
    {
      "destination": "U4af4980629...",
      "events": [
        {
          "type": "message",
          "replyToken": "nHuyWiB7yP5Zw52FIkcQobQuGDXCTA",
          "message": {
            "id": "325708",
            "type": "text",
            "text": "Hello, world!"
          }
        }
      ]
    }
    """
    Then the response status code should be 200
    And the reply message should be
    """
    {
      "replyToken": "nHuyWiB7yP5Zw52FIkcQobQuGDXCTA",
      "messages": [
          {
              "type": "text",
              "text": "Hello, world!"
          }
      ]
    }
    """
