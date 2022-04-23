class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories_expenses
  has_many :categories, through: :categories_expenses

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
