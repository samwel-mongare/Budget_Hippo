class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories_expenses
  has_many :categories, through: :categories_expenses
  validates :amount, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
