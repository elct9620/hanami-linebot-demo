# frozen_string_literal: true

Hanami.app.register_provider(:aotoki_ai) do
  prepare do
    require 'aotoki_ai/client'
  end

  start do
    register(:aotoki_ai, AotokiAi::Client.open)
  end

  stop do
    target[:aotoki_ai].close
  end
end
