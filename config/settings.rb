# frozen_string_literal: true

module SmartAssist
  class Settings < Hanami::Settings
    # Define your app settings here, for example:
    #
    # setting :my_flag, default: false, constructor: Types::Params::Bool
    setting :line_channel_id, constructor: Types::Params::String
    setting :line_channel_token, constructor: Types::Params::String
    setting :line_channel_secret, constructor: Types::Params::String
  end
end
