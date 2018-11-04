Rails.application.routes.draw do
  resources :gossip
  resources :registration
  resources :user
  root  'registration#login'
  post 'registration/verif', to: 'registration#verif'
  get 'registration/logout', to: 'registration#logout'
  get 'comment/like/:id', to: 'comment#like', as: 'comment_like'
  get 'comment/comment/:id', to: 'comment#comment', as: 'comment_comment'
  post 'comment/added_comment', to:'comment#add_comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
