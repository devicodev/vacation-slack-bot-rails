## Vacation Slack Bot Rails

Slack bot for leave(sick, personal, vacation)

### Commands
#### Leave today
> @botname: I leave today

### Installation
1. [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://www.heroku.com/deploy/?template=https://github.com/ice5050/vacation-slack-bot-rails)
2. Set Environment Variable on heroku instance
  - GOOGLE_CLIENT_ID _your google app id_
  - GOOGLE_CLIENT_SECRET _your google app secret_  
  - GOOGLE_CALENDAR_ID _your calendar id, set it to **primary** if you prefer to use your main calendar_
  - SLACK_API_TOKEN _your slack bot api token_
3. Activate worker from Heroku app dashboard
