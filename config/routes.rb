Rails.application.routes.draw do
  root 'companies#index'
  resources :companies do
  	resources :bank_accounts
  end

  resources :users
  resources :sessions

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
