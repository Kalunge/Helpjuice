Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "searches#index"
  post '/search', to: 'searches#create'
  resources :searches, only: [:index, :create]
end
