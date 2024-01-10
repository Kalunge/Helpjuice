Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "searches#index"
  post '/search', to: 'searches#create'
  get 'searches/all_searches', to: 'searches#all_searches'
end
