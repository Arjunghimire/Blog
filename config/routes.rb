Rails.application.routes.draw do
   	
  devise_for :admins
  root 'welcome#index'
  resources :welcome ,only: [:index]
  resources :abouts ,only: [:index]
  resources :contacts
  resources :admins
  resources :blogs
  resources :galleries
end
