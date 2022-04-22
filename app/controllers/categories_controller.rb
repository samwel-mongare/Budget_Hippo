class CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to inventories_path, notice: 'Category created successfully' }
      else
        format.html { render :new, status: :unprocessable_entity, alert: 'Category created successfully' }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
