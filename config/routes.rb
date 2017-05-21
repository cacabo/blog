Rails.application.routes.draw do
  devise_for :admins
  get 'welcome/index'

  resources :articles
  
  root 'welcome#index'
end
