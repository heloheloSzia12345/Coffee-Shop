class OrdersController < ApplicationController
  def new
    @user = User.current_user
    @order = Order.sample_order
  end
  
  def create 
    redirect_to order_confirmation_path
  end

  def show
    @user = User.current_user
    @order = Order.sample_order
  end
end
