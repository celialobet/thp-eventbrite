Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  get 'events/index' , to: 'events#index'
  # resources :registration, only: [:new]
  # resources :users
  # resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
