class IncomesController < ApplicationController
  require "time"

  before_action :income_id, only: [:show, :destroy, :edit, :update]
  before_action :move_to_root, only: [:show, :edit, :update, :destroy, :search]

  def index
    @year_income = params[:year_income] || Time.now.year 
    @year_spending = params[:year_spending] || Time.now.year 
    @month_income = params[:month_income] || Time.now.month
    @month_spending = params[:month_spending] || Time.now.month
    @year_spending_graph = params[:year_spending_graph] || Time.now.year
    @month_spending_graph = params[:month_spending_graph] || Time.now.month

    @start_time_income = Time.new(@year_income, @month_income, 1)
    @end_time_income = @start_time_income.end_of_month
    @start_time_spending = Time.new(@year_spending, @month_spending, 1)
    @end_time_spending = @start_time_spending.end_of_month
    @start_time_graph = Time.new(@year_spending_graph, @month_spending_graph, 1)
    @end_time_graph = @start_time_graph.end_of_month
    
    @prev_date_income = @start_time_income -1.month
    @next_date_income = @start_time_income +1.month
    @prev_date_spending = @start_time_spending -1.month
    @next_date_spending = @start_time_spending +1.month
    @prev_date_spending_graph = @start_time_graph -1.month
    @next_date_spending_graph = @start_time_graph +1.month

    @incomes_time = Income.where(date: @start_time_income..@end_time_income).where(user_id: current_user.id).order(date: "ASC")
    @spendings_time = Spending.where(date: @start_time_spending..@end_time_spending).where(user_id: current_user.id).order(date: "ASC")
    @this_month = Time.new.month
    @this_month_income_sum = Income.where(date: @start_time_graph..@end_time_graph).where(user_id: current_user.id).order(date: "ASC").sum(:price)
    @this_month_spending_sum = Spending.where(date: @start_time_graph..@end_time_graph).where(user_id: current_user.id).order(date: "ASC").sum(:price)
    @expense_sum = @this_month_income_sum - @this_month_spending_sum
    @spending_data = Spending.where(date: @start_time_graph..@end_time_graph).where(user_id: current_user.id)
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.category == "給料"
      @income.image = "salary.png"
    elsif @income.category == "おこづかい"
      @income.image = "pocket-money.png"
    elsif @income.category == "賞与"
      @income.image = "bonus.png"
    elsif @income.category == "投資"
      @income.image = "investing.png"
    elsif @income.category == "副業"
      @income.image = "iseconnd-business.png"
    elsif @income.category == "臨時収入"
      @income.image = "incidental-income.png"
    elsif @income.category == "その他"
      @income.image = "etc.png"
    end
    if @income.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
  end

  def destroy
    @income.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @income.update(income_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    @spendings = Spending.where(user_id: current_user.id).includes(:user).order(date: "ASC")
  end

  def report
    @year_spending_report_graph = params[:year_spending_report_graph] || Time.now.year
    @year_income_report_graph = params[:year_income_report_graph] || Time.now.year
    @month_spending_report_graph = params[:month_spending_report_graph] || Time.now.month
    @month_income_report_graph = params[:month_income_report_graph] || Time.now.month
  
    @start_time_spending_report_graph = Time.new(@year_spending_report_graph, @month_spending_report_graph, 1)
    @end_time_spending_report_graph = @start_time_spending_report_graph.end_of_month
    @start_time_income_report_graph = Time.new(@year_income_report_graph, @month_income_report_graph, 1)
    @end_time_income_report_graph = @start_time_income_report_graph.end_of_month
  
    @prev_date_spending_report_graph = @start_time_spending_report_graph -1.month
    @next_date_spending_report_graph = @start_time_spending_report_graph +1.month
    @prev_date_income_report_graph = @start_time_income_report_graph -1.month
    @next_date_income_report_graph = @start_time_income_report_graph +1.month


    @this_month_income_sum = Income.where(date: @start_time_income_report_graph..@end_time_income_report_graph).where(user_id: current_user.id).order(date: "ASC").sum(:price)
    @this_month_spending_sum = Spending.where(date: @start_time_spending_report_graph..@end_time_spending_report_graph).where(user_id: current_user.id).order(date: "ASC").sum(:price)
    @expense_sum = @this_month_income_sum - @this_month_spending_sum

    @this_month = Time.new.month
    @spending_data = Spending.where(date: @start_time_spending_report_graph..@end_time_spending_report_graph).where(user_id: current_user.id)
    @income_data = Income.where(date: @start_time_income_report_graph..@end_time_income_report_graph).where(user_id: current_user.id)

    @incomes_time = Income.where(date: @start_time_income_report_graph..@end_time_income_report_graph).where(user_id: current_user.id).order(date: "ASC")
    @spendings_time = Spending.where(date: @start_time_spending_report_graph..@end_time_spending_report_graph).where(user_id: current_user.id).order(date: "ASC")


    @spending_data_graph = Spending.all.where(user_id: current_user.id)
    @income_data_graph = Income.all.where(user_id: current_user.id)
  end

  private
  def income_params
    params.require(:income).permit(:price, :category, :memo, :date, :image).merge(user_id: current_user.id)
  end

  def income_id
    @income = Income.find(params[:id])
  end

  def move_to_root
    if current_user.id != @income.user.id
      redirect_to root_path
    end
  end
end
