class AddPhoneNumberToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :phone_number, :string
  end
end
