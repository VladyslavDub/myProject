Rails.application.routes.draw do

  devise_for :users
  root to: 'pins#index'
  resources :pins

  resources :comments, only: %i[destroy]

  resources :categories,only: %i[index show]

  post ":commentable_type/:commentable_id/comment", to: "comments#create", as: :commentable_comment

  resource :profile, only: %i[show]
  


end
