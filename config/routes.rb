Rails.application.routes.draw do
  devise_for :admins
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
