class Income < ApplicationRecord
  belongs_to :month
  
  validates :name, presence: true
  validates :amount, numericality: true, comparison: { greater_than: 0 }
end
