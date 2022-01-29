class Category < ApplicationRecord
  belongs_to :month
  has_many :expenses, dependent: :destroy
  
  validates :name, presence: true
  validates :tag, presence: true
  validates :budget, numericality: true, comparison: { greater_than: 0 }
end
