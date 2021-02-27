Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      resources :galleries,only:[:index,:show]
      resources :exhibitions,only:[:index,:show]
      get :health_check, to: 'health_check#index'
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth',
  controllers: {
    registrations: 'auth/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
