Rails.application.routes.draw do
  root to: 'posts#home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
  	resources :comments
  end
end
