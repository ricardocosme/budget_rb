class IncomesController < ApplicationController
  def index
    @incomes = Income.all
  end
  
  def show
    @income = Income.find(params[:id])
  end
  
  def new
    @month = Month.find(params[:month_id])
    @income = Income.new()
  end

  def create
    @month = Month.find(params[:month_id])
    @income = @month.incomes.create(income_params)

    if @income.save
      redirect_to month_path(@month)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @month = Month.find(params[:month_id])
    @income = Income.find(params[:id])
  end

  def update
    @month = Month.find(params[:month_id])
    @income = Income.find(params[:id])

    if @income.update(income_params)
      redirect_to @month
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @month = Month.find(params[:month_id])
    @income = @month.incomes.find(params[:id])
    @income.destroy

    redirect_to month_path(@month), status: 303
  end
  
  private

  def income_params
    params.require(:income).permit(:name, :amount)
  end
end
