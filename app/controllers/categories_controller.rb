class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def show; end

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
