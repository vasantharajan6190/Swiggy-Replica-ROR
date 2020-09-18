class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.string :hotel
      t.string :name
      t.text :img
      t.string :foodtype
      t.string :describe
      t.string :price
      t.integer :user_id

      t.timestamps
    end
  end
end
