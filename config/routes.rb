Rails.application.routes.draw do

  root 'posts#index'

  match "posts/index" => "posts#like", :via => :post, :as => :like

  match "follow/:id" => "users#follow", :via => :post, :as => :follow

  match "unfollow/:id" => "users#unfollow", :via => :delete, :as => :unfollow

  resources :posts
  resources :comments

  devise_for :users

  get "users/:id/show" => "users#show", :as => :show_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
