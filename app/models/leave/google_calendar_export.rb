class Leave::GoogleCalendarExport
  def initialize(leave, admin)
    @leave = leave
    @admin = admin
  end

  def export
    calendar = Google::Apis::CalendarV3::CalendarService.new
    calendar.authorization = Signet::OAuth2::Client.new(
      :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
      :token_credential_uri =>  'https://www.googleapis.com/oauth2/v3/token',
      :client_id => @admin.setting.google_client_id,
      :client_secret => @admin.setting.google_client_secret,
      :scope => ['https://www.googleapis.com/auth/calendar','https://www.googleapis.com/auth/calendar.readonly'],
      :access_token => @admin.setting.token.fresh_token
    )
    event = Google::Apis::CalendarV3::Event.new({
      summary: "#{@leave.slack_user_id} leave",
      location: 'Thailand',
      start: {
        date: Date.today,
      },
      end: {
        date: Date.today,
      },
    })
    calendar.insert_event(@admin.setting.google_calendar_id, event)
  end
end
