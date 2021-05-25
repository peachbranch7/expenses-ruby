class SpendingsController < ApplicationController

  before_action :spending_id, only: [:show, :destroy, :edit, :update]
  before_action :move_to_root, only: [:show, :edit, :update, :destroy]
  def new
    @spending = Spending.new
  end

  def create
    @spending = Spending.new(spending_params)
    if @spending.category == "食費"
      @spending.image = "meal.png"
    elsif @spending.category == "日用品"
      @spending.image = "daily-necessities.png"
    elsif @spending.category == "ファッション"
      @spending.image = "fashion.png"
    elsif @spending.category == "趣味・娯楽"
      @spending.image = "hobby.png"
    elsif @spending.category == "医療費"
      @spending.image = "medical.png"
    elsif @spending.category == "交際費"
      @spending.image = "entertainment-expenses.png"
    elsif @spending.category == "光熱費"
      @spending.image = "tility-charges.png"
    elsif @spending.category == "交通費"
      @spending.image = "travel-cost.png"
    elsif @spending.category == "その他"
      @spending.image = "etc.png"
    end
    if @spending.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @spending.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @spending.update(spending_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    @spendings = Spending.where(user_id: current_user.id).includes(:user).order(date: "ASC")
  end

  private
  def spending_params
    params.require(:spending).permit(:price, :category, :memo, :date, :image).merge(user_id: current_user.id)
  end

  def spending_id
    @spending = Spending.find(params[:id])
  end

  def move_to_root
    if current_user.id != @spending.user.id
      redirect_to root_path
    end
  end
end
