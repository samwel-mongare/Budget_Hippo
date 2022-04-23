class Category < ApplicationRecord
  has_many :categories_expenses
  has_many :expenses, through: :categories_expenses
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
  
  def compute_total_expenses(expenses)
    expenses.map { |expense| expense.amount }.sum
  end
end
