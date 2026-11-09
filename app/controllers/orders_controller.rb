class OrdersController < ApplicationController
  before_action :require_login

  def new
    @user = current_user
    @order = @user.orders.last || Order.first
  end

  def create
    @order = current_user.orders.create!(
      order_number: "#FMK-2026-#{rand(100..999)}",
      notes: params[:notes],
      payment_method: params[:payment_method] || "Készpénz",
      discount: 0,
      estimated_time: "15-20 perc",
      total_price: 1800
    )

    Product.all.limit(2).each do |prod|
      @order.order_items.create!(product: prod, quantity: 1, unit_price: prod.price)
    end

    current_user.increment!(:points)

    redirect_to order_confirmation_path(order_id: @order.id)
  end

  def show
    @user = current_user
    @order = params[:order_id] ? Order.find_by(id: params[:order_id]) : @user.orders.last
  end
end
