class Order
  attr_accessor :order_number, :items, :discount, :estimated_time

  def initialize(attrs = {})
    @order_number = attrs[:order_number] || "#FMK-2026-084"
    @items = attrs[:items] || []
    @discount = attrs[:discount] || 0
    @estimated_time = attrs[:estimated_time] || "15-20 perc"
  end

  def total 
    @items.sum { |item| item[:price] * item[:quantity] } - @discount
  end

  def self.sample_order
    new(
      order_number: "#FMK-2026-084",
      items: [
        { name: "Cappuccino", price: 500, quantity: 2 },
        { name: "Croissant", price: 800, quantity: 1 }
      ],
      discount: 0
    )
  end
end
