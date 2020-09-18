class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :hotel
      t.string :name
      t.string :foodtype
      t.string :img
      t.string :describe
      t.string :price
      t.integer :user_id
      t.text :address

      t.timestamps
    end
  end
end
