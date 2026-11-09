class ApplicationController < ActionController::Base
  before_action :find_user
  helper_method :current_user

  private

  def find_user
    @current_user = User.find_by(id: session[:user]) if session[:user]
  end  

  def current_user
    @current_user
  end

  def require_login
    unless current_user
      flash[:notice] = "Kérjük, jelentkezz be a folytatáshoz!"
      redirect_to login_path
    end
  end
end
