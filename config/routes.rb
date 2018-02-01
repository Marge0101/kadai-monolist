Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
  get 'rankings/want', to: 'rankings#want'
  get 'rankings/have', to: 'rankings#have'
  
  resources :users, only: [:show, :new, :create]
  #want 機能実装
  resources :items, only: [:new,:show]
  #resources :items, only: [:new]
  resources :ownerships, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
