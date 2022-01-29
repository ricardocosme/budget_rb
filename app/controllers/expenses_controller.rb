class ExpensesController < ApplicationController
  def new
    @month = Month.find(params[:month_id])
    @category = Category.find(params[:category_id])
    @expense = Expense.new()
  end
  
  def create
    @month = Month.find(params[:month_id])
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.create(expense_params)

    if @expense.save
      redirect_to month_path(@month)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:amount)
  end
end
