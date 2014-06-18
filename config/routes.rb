Blog::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root 'main#index'

  resources :posts
  resources :tags, except: :show
end
