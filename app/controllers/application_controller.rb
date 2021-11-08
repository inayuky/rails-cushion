class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def logged_in_user
    unless @current_user
      flash[:danger] = "ログインしてください"
      session[:forwarding_url] = request.original_url if request.get?
      redirect_to login_path 
    end
  end
end
