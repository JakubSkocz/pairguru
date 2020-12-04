Rails.application.routes.draw do
  devise_for :users

  root "home#welcome"
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end

  resources :top_commenters, only: :index

  resources :movies, only: [:index, :show] do
    member do
      get :send_info
      resources :comments, only: [:new, :create, :destroy]      
    end
    collection do
      get :export
    end
  end
end
