Rails.application.routes.draw do 

  
  

    post 'sessions/new'
    get 'sessions/new'
  get 'users/new'
    root 'users#home'
    post '/login', to: 'users#login'
    # resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
    resources :users
    resources :meetings
    resources :bookings
    # resources :sessions
    # get "/:username" => "users#show"
    # controller :sessions do
    #     # get  "/login",  :action => :new,     :as => :login
    #     # post "/login",  :action => :create,  :as => false
    #     get  "/logout", :action => :destroy, :as => :logout
    # end
    get    'sign_in'   => 'sessions#new'
    post   'sign_in'   => 'sessions#create'
    delete 'sign_out'  => 'sessions#destroy'
    get '/login', to: 'users#login'
    # post '/login', to: 'sessions#create'
    # post '/logout', to: 'sessions#destroy'
    # get '/logout', to: 'sessions#destroy'
    # get '/new', to: 'users#new'
    # post '/new', to: 'users#new'
    # get '/users', to: 'users#show'
    # post '/users', to: 'users#show'
    # get '/show', to: 'meetings#show'
    # post'/show', to:'meetings#show'
    # get '/booking', to: 'bookings#index'
    # post '/bookings', to: 'bookings#create'
    # post '/users', to: "users#show"
    
end
    