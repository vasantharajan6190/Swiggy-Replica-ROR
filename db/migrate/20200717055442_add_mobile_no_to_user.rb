class AddMobileNoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mobile, :string
  end
end
