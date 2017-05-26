Rails.application.routes.draw do
  devise_for :admins
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'

  get 'projects', to: 'welcome#projects', as: 'projects'
  get 'art', to: 'weclome#art', as: 'art'
  get 'design', to: 'welcome#design', as: 'design'
  get 'contact', to: 'welcome#contact', as: 'contact'
  get 'articles/tags/:tag', to: 'articles#index', as: 'tag'
end
