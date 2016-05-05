Rails.application.routes.draw do
  
  resources :assignments 

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root to: 'assignments#index'

  get     'home'  => 'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'

  resources :sessions, only: [:create, :destroy]
  resources :users
  resources :groups
  resources :repositories
end
