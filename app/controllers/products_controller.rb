class ProductsController < ApplicationController
  def index
    @user = User.current_user
    @products = Product.all
  end
end
