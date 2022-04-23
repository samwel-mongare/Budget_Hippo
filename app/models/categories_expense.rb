class CategoriesExpense < ApplicationRecord
  belongs_to :category
  belongs_to :expense

  validates :category_id, presence: true
  validates :expense_id, presence: true
end
