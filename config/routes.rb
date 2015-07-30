ProjectManager::Application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tasks, only: [:show]
  end
  root to: 'pages#home'

end
