Rails.application.routes.draw do
  devise_for :admins, controllers: {}, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }

  resources :articles do
    resources :comments
  end

  resources :contacts, only: [:new, :create]

  root 'welcome#index'

  get 'projects', to: 'welcome#projects', as: 'projects'
  get 'projects/:project', to: 'projects#show'
  get 'freelancing', to: 'welcome#freelancing', as: 'freelancing'
  get 'art-design', to: 'welcome#art-design', as: 'art_design'
  get 'articles/tags/:tag', to: 'articles#index', as: 'tag'
end
