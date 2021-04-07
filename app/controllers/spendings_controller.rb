class SpendingsController < ApplicationController

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
    @spending = Spending.find(params[:id])
  end

  def destroy
    @spending = Spending.find(params[:id])
    @spending.destroy
    redirect_to root_path
  end

  private
  def spending_params
    params.require(:spending).permit(:price, :category, :memo, :date).merge(user_id: current_user.id)
  end
end
