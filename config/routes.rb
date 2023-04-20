Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :index, :edit, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/homes/about" => "homes#about", as: "about"
end
