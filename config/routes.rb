Rails.application.routes.draw do
  get 'posts/show'
  get 'categories/show'
  get 'home/index'
  # Devise for Admin users and ActiveAdmin routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Root route for admin users (if logged in)
  authenticated :admin_user do
    root 'admin/dashboard#index', as: :authenticated_admin
  end

  # For regular users, show the public home page
  root 'home#index'  # Default root for all users (public, unauthenticated users)
  
  # Resources for posts and categories
  resources :posts, only: [:show]  # Show individual post
  resources :categories, only: [:show] do
    resources :posts, only: [:index]  # Posts under each category
  end
end
