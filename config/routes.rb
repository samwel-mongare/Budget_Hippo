Rails.application.routes.draw do
  get 'beans/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :beans
  # Defines the root path route ("/")
  # root "articles#index"
end
