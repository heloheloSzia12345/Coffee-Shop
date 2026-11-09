class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :order_number
      t.integer :total_price
      t.integer :discount
      t.text :notes
      t.string :payment_method
      t.string :estimated_time

      t.timestamps
    end
  end
end
