Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'posts#index'
  delete 'sign_out', to: 'sessions#destroy'
  root 'posts#index'

  resources :sessions, only: [:new, :create]
  resources :users do
    resources :posts
  end
end
