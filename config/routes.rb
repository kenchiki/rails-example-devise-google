Rails.application.routes.draw do
  root 'articles#index'
  resources :articles
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
