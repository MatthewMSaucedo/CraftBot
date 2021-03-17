# frozen_string_literal: true

require_relative "craft_bot/version"

require "discordrb"

module CraftBot
  class Error < StandardError; end

  log = Logger.new

  # TODO: Set up propper logging
  log.info "Initializing bot..."
  bot = init_bot()

  log.info "Initializing commands..."
  init_commands(bot)

  log.info "Starting CraftBot"
  bot.run

  def init_bot()
    bot_auth_info = fetch_bot_auth_map()
    Discordrb::Bot.new(bot_auth_info)
  end

  # TODO: Grab from secrets file in .gitignore
  def fetch_bot_auth_map()
    { token: "", client_id: 0 }
  end

  # TODO: Read from lib/craft_bot/tasks/
  def init_commands(bot)
    bot.message(with_text: 'Ping!') do |event|
      event.respond 'Pong!'
    end
  end
end
