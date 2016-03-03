class SessionsController < ApplicationController
  def new
  end

  def create
    info = request.env['omniauth.auth']['info']
    auth = request.env['omniauth.auth']['credentials']
    admin = Admin.find_or_create_by(email: info['email'])
    admin.setting = Setting.first_or_create
    admin.setting.token = Token.first_or_create(
      refresh_token: auth['refresh_token'],
      expires_at: Time.at(auth['expires_at']).to_datetime,
      access_token: auth['token']
    )
    admin.save
    session[:current_admin_id] = admin.id
    redirect_to edit_setting_path(admin.setting)
  end
end
