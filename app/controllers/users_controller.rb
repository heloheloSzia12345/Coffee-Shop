class UsersController < ApplicationController
  before_action :require_login, only: [:dashboard, :show, :settings, :update_settings]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      flash[:notice] = "Sikeres regisztráció!"
      redirect_to dashboard_path
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def dashboard
    @user = current_user
  end

  def show
    @user = current_user
  end

  def settings
    @languages = ["Magyar", "English", "Deutsch"]
  end

  def update_settings
    flash[:notice] = "Beállítások elmentve!"
    redirect_to settings_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birth_date, :phone, :bio, :password, :password_confirmation)
  end
end
