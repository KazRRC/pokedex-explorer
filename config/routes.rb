Rails.application.routes.draw do
  root "home#index"

  resources :pokemon, only: [:index, :show]
  resources :types, only: [:index, :show]
  resources :regions, only: [:index, :show]

  get "about", to: "about#index"
end