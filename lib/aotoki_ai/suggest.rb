# frozen_string_literal: true

module AotokiAi
  class Suggest < Async::REST::Representation[Async::REST::Wrapper::JSON]
    def success?
      value[:success] == true
    end

    def message
      value.dig(:data, :message)
    end
  end
end
