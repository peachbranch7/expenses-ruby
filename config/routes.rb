Rails.application.routes.draw do
  devise_for :users
  
  root to: 'incomes#index'
  resources :incomes, only: [:new, :create, :show]
  resources :spendings, only: [:new, :create, :show]
end
