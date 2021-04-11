# frozen_string_literal: true

require_relative "craft_bot/version"
require_relative "util/logger"

require "discordrb"
require 'yaml'

class Error < StandardError; end
class Bot
  def initialize(logger:, secrets:)
    @@tasks     = secrets["tasks"]
    @@api_creds = secrets["api_credentials"]
    @@bot       = Discordrb::Bot.new(fetch_bot_auth_info)
  end

  def fetch_bot_auth_info()
    {
      token: @@api_creds["client_secret"],
      client_id: @@api_creds["client_id"]
    }
  end

  # TODO: Read from lib/craft_bot/tasks/
  def init_commands()
    @@bot.message(with_text: 'Ping!') do |event|
      event.respond 'Pong!'
    end
  end

  def run
    @@bot.run
  end

end

log = CBLogger.new
secrets = YAML.load_file('secrets.yml')

log.info "Initializing bot..."
craft_bot = Bot.new(logger: log, secrets: secrets)

log.info "Initializing commands..."
craft_bot.init_commands

log.info "Starting CraftBot"
craft_bot.run
