Rails.application.routes.draw do
  
  root 'sessions#new'
 	post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
