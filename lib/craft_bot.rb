# frozen_string_literal: true

require_relative "craft_bot/version"

require "discordrb"

module CraftBot
  class Error < StandardError; end

  # TODO: Set up propper logging
  print "INFO - Initializing bot...\n"
  bot = init_bot()

  print "INFO - Initializing commands...\n"
  init_commands(bot)

  print "INFO - Starting CraftBot\n"
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
