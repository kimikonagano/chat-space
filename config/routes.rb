Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: [:delete]
  resources :messages, only: [:index]
end
