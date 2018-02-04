Rails.application.routes.draw do

  resources :cards
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'


  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/spirits',    to: 'users#spirits'
  get  '/story',    to: 'users#story'
  get  '/prologue',    to: 'users#prologue'
  get  '/pocketwatch',    to: 'users#pocketwatch'
  get  '/seasons',    to: 'users#seasons'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]


end
