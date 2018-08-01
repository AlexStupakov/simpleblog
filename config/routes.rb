Rails.application.routes.draw do
  root 'categories#index'
  resources :categories, except: :show do
    resources :posts do
    end
  end
  resources :comments, only: [:show, :create]

  mount ActionCable.server => '/cable'
end
