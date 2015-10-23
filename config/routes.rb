Rails.application.routes.draw do
  root to: 'home#index'
  patch 'capture', to: 'pokemons#capture'
  patch 'damage', to: 'pokemons#damage'
  devise_for :trainers
  resources :trainers
  resources :pokemons
end
