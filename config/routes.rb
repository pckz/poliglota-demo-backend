Rails.application.routes.draw do
  	resources :users, only: [:index, :create]
  	resources :locations, only: [:index]
end

