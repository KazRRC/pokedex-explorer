Rails.application.routes.draw do
  root "home#index"

  resources :pokemon, only: [:index, :show]
  resources :types, only: [:index, :show]
  resources :regions, only: [:index, :show]

  get "random", to: "pokemon#random"
  get "about", to: "about#index"
end