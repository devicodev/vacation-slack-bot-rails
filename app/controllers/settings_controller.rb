class SettingsController < ApplicationController
  def edit
    load_setting
  end

  def update
    load_setting
    @setting.update(setting_params)
    if @setting.previous_changes.key?('google_client_id') || @setting.previous_changes.key?('google_client_secret')
      redirect_to new_session_path
    else
      render 'edit'
    end
  end

  private

  def load_setting
    @setting ||= Setting.first_or_create
  end

  def setting_params
    params.require(:setting).permit(:google_client_id, :google_client_secret, :slack_api_token, :google_calendar_id)
  end
end
