class CategoryItemsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @expense = Expense.find(params[:expense_id])
    @category_item = @category.category_items.build(expense: @expense)
  end
end
