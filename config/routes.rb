Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "pages#home"
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'home', to: 'pages#home', as: :home

  get 'about', to: 'pages#about', as: :about

  get 'portfolio', to: 'pages#portfolio', as: :portfolio
  resources :projects do
  end

  get 'services', to: 'pages#services', as: :services

  get 'blog', to: 'pages#blog', as: :blog

  get 'contact', to: 'pages#contact', as: :contact


  # :controllers => { :omniauth_callbacks => "callbacks" }
  # Defines the root path route ("/")
  # root "articles#index"
end


