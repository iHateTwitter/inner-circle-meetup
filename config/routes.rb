Rails.application.routes.draw do
  resources :participations, only: %i[index show]
  resources :meetups do
    put :join, on: :member
  end
  root 'meetups#index'
  get 'sign_in', to: 'dummy#sign_in'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
