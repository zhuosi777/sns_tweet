Rails.application.routes.draw do

  devise_for :users
  root "tweets#index"
  resources :tweets
  get   'users/:id'   =>  'users#show'
  patch   'tweets/:id'  => 'tweets#update'
end
