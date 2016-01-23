Bloccit::Application.routes.draw do
  get 'ratings/edit'

  get 'ratings/show'

  get 'labels/show'

  resources :topics do
     resources :posts, except: [:index]
   end

   resources :posts, only: [] do
        resources :comments, only: [:create, :destroy]
      end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :labels, only: [:show]
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
