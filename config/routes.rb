Rails.application.routes.draw do
  devise_for :users
  root to: 'pins#index'
  resources :pins
  
end
