class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @categories = Category.all.order(created_at: :desc)
    @categories.each do |category|
      @expenses = category.expenses.order(created_at: :desc)
      @total_expenses = category.compute_total_expenses(@expenses)
    end
  end

  def show
    @expenses = @category.expenses.order(created_at: :desc)
    @category_id = Category.find(@expenses[0].category_id) unless @expenses.empty?
    @total_expenses = @category.compute_total_expenses(@expenses)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    respond_to do |format|
      format.html do
        if @category.save
          flash[:notice] = 'Category added successfully.'
          redirect_to categories_path
        else
          flash[:alert] = 'Category creation failed. Try again'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
