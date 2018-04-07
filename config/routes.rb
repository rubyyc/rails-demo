Rails.application.routes.draw do


  #get 'users/signup'

  #get 'issues/show'

  #get 'welcome/index'

  get '/about' => 'page#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'page#welcome'

  resource :issues

  # comments
  #post '/issues/:issue_id/comments' => "comments#create"
  resource :comments, only: [:create]

  # issue
  # get 'issues/new' => 'issues#new'
  #
  # get 'issues' => 'issues#index', :as => 'issues'
  #
  # post 'issues' => 'issues#create'
  #
  #
  # get 'issues/:id' => 'issues#show', :as => 'issue'
  #
  # delete 'issues/:id' => 'issues#destory'
  #
  # get 'issues/:id/edit' => 'issues#edit', :as => 'edit_issue'
  #
  # patch 'issues/:id' => 'issues#update'

  get "sign/up" => "users#signup", :as => "signup"
  get "login" => "users#login", :as => "login"

  post "create_login_session" => "users#create_login_session"
  delete "logout" => "users#logout", :as => "logout"

  resources :users, only: [:create]




end
