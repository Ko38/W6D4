Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  get 'users', to: 'users#index', as: 'user'
  post 'users', to: 'users#create', as: 'user_create'
  get 'users/new', to: 'users#new', as: 'user_new'
  get 'users/:id/edit', to: 'users#edit', as: 'user_edit'
  get 'users/:id', to: 'users#show', as: 'user_show'
  patch 'users/:id', to: 'users#update', as: 'user_update'
  put 'users/:id', to: 'users#update', as: 'user_update_put'
  delete 'users/:id', to: 'users#destroy', as: 'user_destroy'
  
end
