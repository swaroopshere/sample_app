SampleApp::Application.routes.draw do
  
  resources :users
  resources :options
  resources :questions

  match '/startHunt',   :to =>  'questions#landingShow'
  match '/questions/checkAnswer' :to => 'questions#checkAnswer'

  get "pages/home"

  get "pages/contact"

     # The priority is based upon order of creation:
     # first created -> highest priority.

     # Sample of regular route:
     #   match 'products/:id' => 'catalog#view'

end
