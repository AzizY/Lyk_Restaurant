Rails.application.routes.draw do

  devise_for :customers
  devise_for :owners
  resources :places do
    collection do
            get :mine
    end

    resources :comments, only: [:create, :destroy]
    resources :reservations, only: [:create, :destroy]
  end
  resources :categories, only: [:show, :index]
  root 'places#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
