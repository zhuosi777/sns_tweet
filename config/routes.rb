Rails.application.routes.draw do
  
resources :tweets, only:[:index, :new]
  collection do
    post 'create', to: 'tweets#create'

end
