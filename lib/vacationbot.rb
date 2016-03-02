require File.expand_path('../../config/environment', __FILE__)

require_relative 'vacation-bot/commands/add'
require_relative 'vacation-bot/bot'

VacationBot::Bot.run
