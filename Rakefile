# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: %w[run]

task :run do
  ruby "lib/craft_bot.rb"
end
