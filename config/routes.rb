Rails.application.routes.draw do

  scope module: 'admin' do
    devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
end

  scope module: 'users' do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  end

  resources :users, except: [:create,:destroy,:new]
  resources :posts
  resources :pets
  root "homes#index"
  get "/about" => "homes#about"

  namespace :admins do
    root 'top#top'
    resources :genres, only: [:index,:create,:edit,:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
