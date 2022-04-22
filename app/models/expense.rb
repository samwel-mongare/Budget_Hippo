class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories_expenses
  has_many :categories, through: :categories_expenses
end
