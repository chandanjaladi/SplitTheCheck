Rails.application.routes.draw do
  get 'users/show'
  resources :favorites, only: [:create]
  resources :comments, only: [:new, :create]

  #resources :users, only: [:show]
  #resources :votes
  devise_for :users
  root to: 'restaurants#index'
  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update]
  resources :votes, only: [:create]
  get '/search', to: 'restaurants#search', as: 'search'
  delete '/favorites', to: 'favorites#destroy', as: 'unfavorite'
  resource :user
  #post '/vote_will_split/:id', to: 'restaurants#vote_will_split', as: :vote_will_split
  #post '/vote_will_not_split/:id', to: 'restaurants#vote_will_not_split', as: :vote_will_not_split

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
