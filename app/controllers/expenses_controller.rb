class ExpensesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = expense.all
  end

  def show; end

  def new
    @expense = Expense.new
  end

  def create
    @expense = current_user.expenses.new(expense_params)

    respond_to do |format|
      format.html do
        if @expense.save
          flash[:notice] = 'Transaction added successfully.'
          redirect_to categories_path
        else
          flash[:alert] = 'Transaction creation failed. Try again'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
