Rails.application.routes.draw do
  resources :reminders
  resources :notes
  resources :users, only: [:create] do
    post 'login', on: :collection
    delete 'logout', on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
