Rails.application.routes.draw do
  resources :reports
  root to: 'books#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  resources :books
  resources :users, only: %i[show index]
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  post 'follow/:id' => 'follow_relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'follow_relationships#unfollow', as: 'unfollow'
end
