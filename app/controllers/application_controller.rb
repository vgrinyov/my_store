class ApplicationController < ActionController::Base

  def render_403
    render file: 'public/403.html', status: 403
  end

  def render_404
    render file: 'public/404.html', status: 404
  end

  protect_from_forgery with: :exception

  private


  def check_if_admin
    #render text: "Access denied", status: 403 unless current_user.admin == true
    render_403 unless params[:admin]
  end
end
