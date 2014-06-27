Blog::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins, path: 'admin',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout',
                sign_up: 'signup' }

  root 'main#index'

  resources :posts
  resources :tags, except: :show
end
