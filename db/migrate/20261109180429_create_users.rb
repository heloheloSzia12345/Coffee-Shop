class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.string :phone
      t.date :birth_date
      t.text :bio
      t.integer :points

      t.timestamps
    end
  end
end
