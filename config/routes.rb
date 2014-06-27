Blog::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins, path: 'admin',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout',
                sign_up: 'signup' }

  devise_scope :admin do
    get '/admin/password', to: 'admins#edit', as: 'edit_admin_password'
    put '/admin/password_change', to: 'admins#update', as: 'change_admin_password'
  end

  root 'main#index'

  resources :posts
  resources :tags, except: :show
end
