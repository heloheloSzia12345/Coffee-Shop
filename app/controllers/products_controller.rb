class ProductsController < ApplicationController
  before_action :require_login

  def index
    @user = User.current_user
    if params[:query].present?
      @products = Product.where("name LIKE ?", "%#{params[:query]}%")
    else
      @products = Product.all
    end
  end
end
