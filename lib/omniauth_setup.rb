class OmniauthSetup
  # OmniAuth expects the class passed to setup to respond to the #call method.
  def self.call(env)
    new(env).setup
  end

  def initialize(env)
    @env = env
    @request = ActionDispatch::Request.new(env)
  end

  def setup
    @env['omniauth.strategy'].options.merge!(custom_credentials)
  end

  def custom_credentials
    admin = Admin.first
    {
      client_id: Setting.first.google_client_id,
      client_secret: Setting.first.google_client_secret,
      scope: ['email', 'https://www.googleapis.com/auth/calendar','https://www.googleapis.com/auth/calendar.readonly'],
      access_type: 'offline'
    }
  end
end
