class Category < ApplicationRecord
  has_many :categories_expenses
  has_many :expenses, through: :categories_expenses
  belongs_to :user

  def compute_total_expenses(expenses)
    expenses.map { |expense| expense.amount }.sum
  end
end
