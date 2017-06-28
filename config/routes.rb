Rails.application.routes.draw do
  root 'my_threads#index'
  resources :my_threads, only: :index
end
