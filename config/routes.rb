Rails.application.routes.draw do
  namespace :admin do
    get 'users/new'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'login', to: 'login#index'
end
