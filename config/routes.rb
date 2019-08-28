Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'password_resets/new'
  get 'password_resets/edit'

  root 'static_pages#home'

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
  resources :password_resets,     only: [:create, :edit, :update]
end
