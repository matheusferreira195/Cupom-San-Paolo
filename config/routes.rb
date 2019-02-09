Rails.application.routes.draw do
  get 'verificacao/index'
  devise_for :users
  get 'welcome/index'

  resources :docs
  authenticated :user do
    root "docs#index", as: "authenticated_root"
  end

  root "welcome#index"


end
