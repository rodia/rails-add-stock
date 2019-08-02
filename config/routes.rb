Rails.application.routes.draw do
  namespace :admin do
    # get 'users/new'
    resources :users
  end

  get    :login,   to: 'sessions#new'
  post   :login,   to: 'sessions#create'
  delete :logout,  to: 'sessions#destroy'
  get :signup,  to: 'admin/users#new'
end
