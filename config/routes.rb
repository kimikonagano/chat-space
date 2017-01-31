Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: [:index, :delete]
  resources :messages, only: [:index]
end
