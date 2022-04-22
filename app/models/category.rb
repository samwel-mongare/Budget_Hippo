class Category < ApplicationRecord
  has_many :category_items
  belongs_to :user
end
