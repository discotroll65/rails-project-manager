ProjectManager::Application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tasks, only: [:show, :new]
  end
  resources :tasks, only: [:create, :destroy]
  root to: 'pages#home'

end
