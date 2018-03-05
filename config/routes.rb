Rails.application.routes.draw do
  root 'associates#login'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'hrmsdata/login' => 'hrmsdata#login'
  resources :associates do 
    get 'login' => 'associates#login'
    collection do
      get 'search' => 'associates#search'
      get 'export' => 'associates#export'
      get 'home' => 'associates#home'
    end
  end
  resources :hrmsdata do
    collection do
      post 'import' => 'hrmsdata#import'
      get 'search' => 'hrmsdata#search'
      get 'home' => 'hrmsdata#home'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
