Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'

  resources :users, only:[:index, :show, :edit, :update] do
    patch :nonrelease, :release
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    patch :nonrelease, :release
  end
end
