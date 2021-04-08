Rails.application.routes.draw do
  devise_for :users
  
  root to: 'incomes#index'
  resources :incomes do
    collection do
      get 'search'
    end
  end
  resources :spendings do
    collection do
      get 'search'
    end
  end
end
