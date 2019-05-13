Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :musics
  resources :images
  resources :articles
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'account#index'
  resources :account, only: [:index, :show]
  get '/delete_picture/:id/:index', :to => 'articles#delete_picture', as: 'delete_picture'
end
