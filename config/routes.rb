Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  resources :books
  resources :users, only: %i[show index]
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
