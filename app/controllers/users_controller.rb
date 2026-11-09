class UsersController < ApplicationController
  def new
  end
  
  def create
    redirect_to dashboard_path
  end
	
  def dashboard 
    @user = User.current_user
  end

  def show
    @user = User.current_user
  end

  def settings
    @languages = ["Magyar", "English", "Deutsch"]
  end

  def update_settings
    redirect_to settings_path
  end
end
