Rails.application.routes.draw do
  root "forms#new"

  devise_for :users, :controllers => { :registrations => 'registrations' }
  as :user do
    get "/register", to: "registrations#new", as: "register"
  end

  resources :forms, only: [:new, :create]

  namespace :admin do
    resources :forms, except: [:new]
    get 'index' => 'forms#index', as: 'index'
  end
  namespace :repair do
    resources :forms, except: [:new]
    get 'index' => 'forms#index', as: 'index'
  end
  namespace :construction do
    resources :forms, except: [:new]
    get 'index' => 'forms#index', as: 'index'
  end

end
