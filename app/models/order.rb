class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :order_number, presence: true

  scope :completed, -> { where(status: "completed") }

  def self.current_cart_for(user)
    user.orders.find_or_create_by!(status: "cart") do |order|
      order.order_number = "#FMK-2026-#{rand(100..999)}"
      order.discount = 0
      order.estimated_time = "15-20 perc"
    end
  end

  def subtotal
    order_items.sum { |item| item.unit_price * item.quantity }
  end

  def calculated_total
    [subtotal - (discount || 0), 0].max
  end
  
end
