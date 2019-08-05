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
  get '/set_images/', :to => 'articles#set_images', as: 'set_images'
  post '/get_images/', :to => 'images#get_images', as: 'get_images'
end
