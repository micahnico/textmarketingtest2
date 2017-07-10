class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.integer :merchant_id

      t.timestamps
    end
  end
end
