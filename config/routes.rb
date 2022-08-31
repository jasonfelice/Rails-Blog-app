Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  get 'likes/create'
  get 'comment/new'
  get 'comment/create'
  post '/create/:id', to: "comments#create"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :likes, only: [:create]
    end
  end
end
