class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :hotel
      t.string :foodtype
      t.string :name
      t.string :describe
      t.text :img
      t.string :price

      t.timestamps
    end
  end
end
