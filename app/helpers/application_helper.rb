module ApplicationHelper
  def current_admin
    return unless session[:current_admin_id]
    @current_admin ||= Admin.find(session[:current_admin_id])
  end
end
