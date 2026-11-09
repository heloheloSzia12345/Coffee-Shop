class SessionsController < ApplicationController
  def new
    redirect_to dashboard_path if current_user
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user] = @user.id
      flash[:notice] = "Sikeres bejelentkezés!"
      redirect_to dashboard_path
    else
      flash.now[:alert] = "Érvénytelen email cím vagy jelszó!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Sikeres kijelentkezés!"
    redirect_to login_path
  end
end
