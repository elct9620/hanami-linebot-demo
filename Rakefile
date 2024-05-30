# frozen_string_literal: true

require 'hanami/rake_tasks'

task :build do
  sh 'sam build --parallel --use-container --cached'
end

task :deploy do
  sh 'sam deploy'
end

task :serve do
  exec 'sam local start-api'
end
