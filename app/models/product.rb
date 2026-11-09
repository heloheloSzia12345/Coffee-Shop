class Product
  attr_accessor :id, :name, :price

  def initialize(id, name, price)
    @id = id
    @name = name
    @price = price
  end

  def self.all
    [
      new(1, "Cappuccino", 500),
      new(2, "Latte", 600),
      new(3, "Espresso", 450),
      new(4, "Croissant", 800)
    ]
  end
end
