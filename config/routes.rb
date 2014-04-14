Blog::Application.routes.draw do
  root 'main#index'

  resources :posts
end
