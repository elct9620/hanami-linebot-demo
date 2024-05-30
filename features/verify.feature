Feature: Verify Webhook

  Scenario: Verify Webhook on LINE
    When an event is sent to the webhook
    """
    {
      "destination": "U4af4980629...",
      "events": []
    }
    """
    Then the response status code should be 200
