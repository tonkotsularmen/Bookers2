Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'download', to: 'config_creators#download'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/home/about" => "homes#about", as: "about"
end
