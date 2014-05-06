Blog::Application.routes.draw do
  root 'main#index'

  resources :posts
  resources :tags, except: :show
end
