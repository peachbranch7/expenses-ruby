Rails.application.routes.draw do
  devise_for :users
  
  root to: 'incomes#index'
  resources :incomes, only: [:new, :create, :show, :destroy, :edit, :update]
  resources :spendings, only: [:new, :create, :show, :destroy, :edit, :update]
end
