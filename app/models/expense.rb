class Expense < ApplicationRecord
  belongs_to :category
  
  validates :amount, numericality: true, comparison: { greater_than: 0 }
end
