Rails.application.routes.draw do


  root 'posts#index'

  match "posts/index" => "posts#like", :via => :post, :as => :like

  resources :posts
  resources :comments

  devise_for :users

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
