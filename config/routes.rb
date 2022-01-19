Rails.application.routes.draw do
  devise_for :users
  root to: 'pins#index'
  resources :pins do
    resources :comments, only: %i[create]
  
  end

end
