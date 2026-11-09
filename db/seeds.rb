# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!(
  name: "Kovács Anna",
  email: "felhasznalo.email@example.com",
  phone: "+36 30 123 4567",
  birth_date: Date.new(1998, 5, 12),
  bio: "Szereti a programozást, a kávét és a hosszú sétákat a természetben.",
  password: "titok",
  password_confirmation: "titok",
  points: 7
)

cappuccino = Product.create!(name: "Cappuccino", price: 500, category: "Kávé")
latte      = Product.create!(name: "Latte", price: 600, category: "Kávé")
espresso   = Product.create!(name: "Espresso", price: 450, category: "Kávé")
croissant  = Product.create!(name: "Croissant", price: 800, category: "Péksütemény")

order = Order.create!(
  user: user,
  order_number: "#FMK-2026-084",
  discount: 0,
  notes: "Kevesebb cukorral",
  payment_method: "Készpénz",
  estimated_time: "15-20 perc",
  total_price: 1800
)

OrderItem.create!(order: order, product: cappuccino, quantity: 2, unit_price: cappuccino.price)
OrderItem.create!(order: order, product: croissant, quantity: 1, unit_price: croissant.price)
