Blog::Application.routes.draw do
  root 'main#index'

  resources :posts
  resources :categories, except: :show
end
