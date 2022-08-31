Rails.application.routes.draw do
  root "users#index"
  devise_for :users
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end
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
