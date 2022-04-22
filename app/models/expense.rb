class Expense < ApplicationRecord
  has_many :category_items
  belongs_to :author, class_name: 'User'
end
