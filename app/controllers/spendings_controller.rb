class SpendingsController < ApplicationController

  before_action :spending_id, only: [:show, :destroy, :edit, :update]

  def new
    @spending = Spending.new
  end

  def create
    @spending = Spending.new(spending_params)
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
    params.require(:spending).permit(:price, :category, :memo, :date).merge(user_id: current_user.id)
  end

  def spending_id
    @spending = Spending.find(params[:id])
  end
end
