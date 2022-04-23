class ExpensesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    @expense = Expense.find(params[:id])
    @category_id = Category.find(@expense.category_id)
  end

  def new
    @expense = Expense.new
    @categories = Category.all
  end

  def create
    @new_expense = current_user.expenses.new(expense_params)
    @categories = Category.all

    respond_to do |format|
      format.html do
        if @new_expense.save
          CategoriesExpense.create(category_id: @new_expense.category_id, expense_id: @new_expense.id)
          flash[:notice] = 'Transaction added successfully.'
          redirect_to category_path(@new_expense.category_id)
        else
          flash[:alert] = 'Transaction creation failed. Try again'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id)
  end
end
