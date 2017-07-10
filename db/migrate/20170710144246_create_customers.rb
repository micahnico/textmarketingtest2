class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.integer :merchant_id

      t.timestamps
    end
  end
end
