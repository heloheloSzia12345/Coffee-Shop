class OrdersController < ApplicationController
  before_action :require_login

  def new
    @user = current_user
    @order = Order.current_cart_for(@user)
  end
 
  def add_item
    cart = Order.current_cart_for(current_user)
    product = Product.find(params[:product_id])
    item = cart.order_items.find_by(product: product)

    if item
      item.increment!(:quantity)
    else
      cart.order_items.create!(product: product, quantity: 1, unit_price: product.price)
    end

    flash[:notice] = "#{product.name} bekerült a kosárba!"
    redirect_back fallback_location: offers_path
  end

  def increase_item
    item = OrderItem.find(params[:item_id])
    item.increment!(:quantity)
    redirect_to cart_path
  end

  def decrease_item
    item = OrderItem.find(params[:item_id])
    if item.quantity > 1
      item.decrement!(:quantity)
    else
      item.destroy
    end
    redirect_to cart_path
  end

  def create
    @order = Order.current_cart_for(current_user)

    if @order.order_items.empty?
      flash[:alert] = "Üres kosárral nem tudsz megrendelést leadni!"
      redirect_to cart_path and return
    end

    discount_amount = params[:use_points] == "1" && current_user.points >= 10 ? 500 : 0
    current_user.update!(points: current_user.points - 10) if discount_amount > 0

    @order.update!(
      status: "completed",
      notes: params[:notes],
      payment_method: params[:payment_method] || "Készpénz",
      discount: discount_amount,
      total_price: [@order.subtotal - discount_amount, 0].max
    )

    current_user.increment!(:points)

    redirect_to order_confirmation_path(order_id: @order.id)
  end

  def show
    @user = current_user
    @order = params[:order_id] ? current_user.orders.completed.find_by(id: params[:order_id]) : current_user.orders.completed.last
  end
end
