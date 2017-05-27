Rails.application.routes.draw do
  devise_for :admins
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'

  get 'projects', to: 'welcome#projects', as: 'projects'
  get 'freelancing', to: 'welcome#freelancing', as: 'freelancing'
  get 'art-design', to: 'weclome#art-design', as: 'art_design'
  get 'contact', to: 'welcome#contact', as: 'contact'
  get 'articles/tags/:tag', to: 'articles#index', as: 'tag'
end
