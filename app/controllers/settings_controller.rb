class SettingsController < ApplicationController
  def edit
    load_setting
  end

  def update
    load_setting
    @setting.update(setting_params)
    render 'edit'
  end

  private

  def load_setting
    @setting ||= Setting.first
  end

  def setting_params
    params.require(:setting).permit(:slack_api_token, :google_calendar_id)
  end
end
