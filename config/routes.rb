SampleApp::Application.routes.draw do
  
  # The priority is based upon order of creation:
  # first created -> highest priority.
  resources :users
  resources :options
  resources :questions

  match '/startHunt',   :to =>  'questions#landingShow'
  match '/checkAnswer',  :to =>  'questions#checkAnswer'
  
  root :to => 'pages#home'

  get "pages/home"

  get "pages/contact"

     # The priority is based upon order of creation:
     # first created -> highest priority.

     # Sample of regular route:
     #   match 'products/:id' => 'catalog#view'

end
