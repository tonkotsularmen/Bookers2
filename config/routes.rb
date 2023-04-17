Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:create, :index, :show, :edit]
  resources :users, only: [:show, :index, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/homes/about" => "homes#about", as: "about"
end
