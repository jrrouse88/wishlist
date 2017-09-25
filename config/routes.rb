Rails.application.routes.draw do
  root 'sessions#new'
  resources :users

  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy', as: :logout

  resources :comics, except: [:index]
end

=begin
     Prefix     Verb   URI Pattern                Controller#Action
     root        GET    /                          users#index
     users       GET    /users(.:format)           users#index
                 POST   /users(.:format)           users#create
     new_user    GET    /users/new(.:format)       users#new
     edit_user   GET    /users/:id/edit(.:format)  users#edit
     user        GET    /users/:id(.:format)       users#show
                 PATCH  /users/:id(.:format)       users#update
                 PUT    /users/:id(.:format)       users#update
                 DELETE /users/:id(.:format)       users#destroy
     sessions    POST   /sessions(.:format)        sessions#create
     new_session GET    /sessions/new(.:format)    sessions#new
     logout      DELETE /logout(.:format)          sessions#destroy
     comics      POST   /comics(.:format)          comics#create
     new_comic   GET    /comics/new(.:format)      comics#new
     edit_comic  GET    /comics/:id/edit(.:format) comics#edit
     comic       GET    /comics/:id(.:format)      comics#show
                 PATCH  /comics/:id(.:format)      comics#update
                 PUT    /comics/:id(.:format)      comics#update
                 DELETE /comics/:id(.:format)      comics#destroy
=end