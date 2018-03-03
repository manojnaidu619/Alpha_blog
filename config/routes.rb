Rails.application.routes.draw do
  get 'users/new'
  root 'home#rootpage'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users ,except: :new
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
