class ProductsController < ApplicationController
  before_action :require_login

  def index
    @user = User.current_user
    @products = Product.all
  end
end
