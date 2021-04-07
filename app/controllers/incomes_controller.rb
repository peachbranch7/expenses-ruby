class IncomesController < ApplicationController
  require "time"


  def index
    @spendings_time = Spending.where(date: Time.now.beginning_of_month..Time.now.end_of_month).where(user_id: current_user.id).order(date: "ASC")
    @incomes_time = Income.where(date: Time.now.beginning_of_month..Time.now.end_of_month).where(user_id: current_user.id).order(date: "ASC")
    @this_month = Time.new.month
    @income_sum = @incomes_time.sum(:price)
    @spending_sum = @spendings_time.sum(:price)
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private
  def income_params
    params.require(:income).permit(:price, :category, :memo, :date).merge(user_id: current_user.id)
  end
end
