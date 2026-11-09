class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :order_number, presence: true
  
  def calculated_total
    order_items.sum { |item| item.unit_price * item.quantity } - (discount || 0)
  end
end
