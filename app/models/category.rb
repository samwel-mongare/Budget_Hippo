class Category < ApplicationRecord
  has_many :categories_expenses
  has_many :expenses, through: :categories_expenses
  belongs_to :user
end
