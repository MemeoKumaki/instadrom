Rails.application.routes.draw do

  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/update'

  get 'comments/destroy'

  root 'posts#index'

  match "posts/index" => "posts#like", :via => :post, :as => :like

  devise_for :users
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
