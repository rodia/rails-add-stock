Rails.application.routes.draw do
  root 'application#index'

  namespace :admin do
    resources :products
    resources :users
    get :dashboard, to: 'dashboard#index'
  end

  get    :login,   to: 'sessions#new'
  post   :login,   to: 'sessions#create'
  delete :logout,  to: 'sessions#destroy'
  get :signup,  to: 'admin/users#new'

  resources :account_activations, only: [:edit]
end
