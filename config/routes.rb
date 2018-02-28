Rails.application.routes.draw do
  get 'users/new'
  root 'home#rootpage'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users ,except: :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
