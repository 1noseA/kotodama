Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get '/info' => 'homes#info'
  get '/privacy' => 'homes#privacy'

  resources :users, only:[:index, :show, :edit, :update] do
    patch :privated, :publish
  end
  put "/users/:id/hide" => "users#hide", as: 'users_hide'

  resources :posts do
    resources :favorites, only: [:index, :create, :destroy]
    resources :comments, only: [:create, :destroy]
    patch :nonrelease, :release
  end

  resources :categories, only: :show
  resources :genres, only: :show
  get 'search', to: 'posts#search'

  resources :notifications, only: :index do
    collection do
      delete 'destroy_all'
    end
  end

  resources :inquiries, only: [:new, :create]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
