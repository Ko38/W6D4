Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #common routes
  resources :users, only: [:index, :create, :update, :show, :destroy]

  resources :artworks, only: [:create, :update, :show, :destroy]

  resources :artworkshares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]

  resources :likes, only: [:create, :destroy]


  #users/user_id/artworks
  resources :users do
    resources :artworks, only: [:index]
  end


  #users/user_id/comments
  resources :users do 
    resources :comments, only:[:index]
  end


  #users/user_id/artworks/artwork_id/comments
  resources :users, only:[:index] do 
    resources :artworks, only:[:index] do
      resources :comments, only:[:index]
    end
  end


  #artworks/artwork_id/comments
  resources :artworks do 
    resources :comments, only:[:index]
  end


  #artworks/artwork_id/likes
  resources :artworks, only: [:show] do
    resources :likes, only: [:index]
  end


  #comments/comment_id/likes
  resources :comments, only: [:show] do
    resources :likes, only: [:index]
  end

  


  # #users/user_id/artworks/likes
  # resources :users, only: [:show] do
  #   resources :artworks, only: [:show] do
  #     resources :likes, only: [:index]
  #   end
  # end

  # #users/user_id/comments/likes
  # resources :users, only: [:show] do
  #   resources :comments, only: [:show] do
  #     resources :likes, only: [:index]
  #     end
  # end


end
