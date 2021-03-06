Rails.application.routes.draw do
  get 'auth/login'
  post 'auth/signin'

  resources :users, only: [:index, :create, :new, :show] do
    get 'login', on: :collection
    resources :loyalties, only: [:index, :create, :new, :edit]
    resources :transactions, only: [:index, :create, :new]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'auth#login'
end
