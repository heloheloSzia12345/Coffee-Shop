class SessionsController < ApplicationController
  def new
  end
  def create
    redirect_to profile_path
  end
 
  def destroy
    redirect_to login_path
  end
end
