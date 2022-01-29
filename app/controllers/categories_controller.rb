class CategoriesController < ApplicationController
  def new
    @month = Month.find(params[:month_id])
    @category = Category.new()
  end

  def create
    @month = Month.find(params[:month_id])
    @category = @month.categories.create(category_params)

    if @category.save
      redirect_to month_path(@month)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def edit
    @month = Month.find(params[:month_id])
    @category = Category.find(params[:id])
  end

  def update
    @month = Month.find(params[:month_id])
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @month
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @month = Month.find(params[:month_id])
    @category = @month.categories.find(params[:id])
    @category.destroy

    redirect_to month_path(@month), status: 303
  end
  
  private

  def category_params
    params.require(:category).permit(:name, :budget, :tag)
  end
end
