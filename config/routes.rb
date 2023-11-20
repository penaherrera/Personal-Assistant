Rails.application.routes.draw do
  resources :reminders
  
  resources :notes do
    get 'index', on: :collection
  end

  resources :users, only: [:create] do
    post 'login', on: :collection
    delete 'logout', on: :collection
  end
end
