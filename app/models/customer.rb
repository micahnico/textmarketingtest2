class Customer < ApplicationRecord
	belongs_to :merchant
	has_many :customer_messages
	has_many :messages, through: :customer_messages
	default_scope -> { order(created_at: :desc) }
end
