class Month < ApplicationRecord
  has_many :incomes, dependent: :destroy
  has_many :categories, dependent: :destroy
  
  validates :name, presence: true
end
