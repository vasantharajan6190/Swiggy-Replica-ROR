class CreateOtps < ActiveRecord::Migration[5.1]
  def change
    create_table :otps do |t|
      t.integer :otpcode

      t.timestamps
    end
  end
end
