class CategoryItem < ApplicationRecord
  belongs_to :Category
  belongs_to :Expense
end
