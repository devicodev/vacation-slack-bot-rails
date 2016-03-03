require File.expand_path('../../config/environment', __FILE__)

require_relative 'vacation-bot/commands/add'
require_relative 'vacation-bot/bot'

ENV['SLACK_API_TOKEN'] = Setting.first.slack_api_token

VacationBot::Bot.run
