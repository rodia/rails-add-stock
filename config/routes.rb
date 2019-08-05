Rails.application.routes.draw do
  namespace :admin do
    resources :users
    get :dashboard, to: 'dashboard#index'
  end

  get    :login,   to: 'sessions#new'
  post   :login,   to: 'sessions#create'
  delete :logout,  to: 'sessions#destroy'
  get :signup,  to: 'admin/users#new'
end
