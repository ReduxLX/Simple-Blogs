Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Look at posts controller for the index method (action)
  # root is our landing page
  root 'posts#index', as: 'home'
  # All other page routes must use get requests with the following format:
  # get '<url_name>' => '<controller>#<method/action>
  get 'about' => 'pages#about', as: 'about'

  # Add posts as a resource
  resources :posts do
    # Add comments as a resource such that their url is nested
    #/posts/:post_id/comments/:id
    resources :comments
  end

end
