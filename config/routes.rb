Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root  'tweets#index'
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
  post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'
end
