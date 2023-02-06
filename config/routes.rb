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

  # only by logged In # Pages available:

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  get 'messages', to: 'pages#messages', as: :messages

  get 'courses', to: 'pages#courses', as: :courses


  # :controllers => { :omniauth_callbacks => "callbacks" }
  # Defines the root path route ("/")
  # root "articles#index"
  # contactform - email:
  # resources :contacts, only: [:new, :create ]
  # get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'
end


