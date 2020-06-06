Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'

  resources :users, only:[:index, :show, :edit, :update] do
    patch :nonrelease, :release
  end

  resources :posts do
    resources :favorites, only: [:index, :create, :destroy]
    resources :comments, only: [:create, :destroy]
    patch :nonrelease, :release
  end

  resources :notifications, only: :index do
    collection do
      delete 'destroy_all'
    end
  end
end
