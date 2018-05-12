Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  
  root 'pages#index'
  get 'index', to: 'pages#index'
  get 'info', to: 'pages#info'
  get 'media', to: 'pages#media'
  get 'admin', to: 'admin#new'
  get 'admin_dashboard', to: 'admin#admin_dashboard'
  get 'logout', to: 'admin#logout'
  
  resources :pages
  resources :admin
  resource :pages, only: [:admin] do
    collection do
      patch 'check'
    end
  end
end
