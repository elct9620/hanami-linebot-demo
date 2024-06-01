# frozen_string_literal: true

Hanami.app.register_provider(:markdown) do
  prepare do
    require 'redcarpet'
    require 'redcarpet/render_strip'
  end

  start do
    register(:markdown, Redcarpet::Markdown.new(Redcarpet::Render::StripDown))
  end
end
