Rails.application.routes.draw do
  root 'companies#index'
  resources :companies do
  	resources :bank_accounts
  end
end
