SampleApp::Application.routes.draw do
  
  # The priority is based upon order of creation:
  # first created -> highest priority.
  resources :users
  resources :options
  resources :questions

  match '/startHunt',   :to =>  'questions#landingShow'
<<<<<<< HEAD
  match '/questions/checkAnswer' :to => 'questions#checkAnswer'
=======
  match '/checkAnswer'  :to =>  'questions#checkAnswer'
>>>>>>> b345b708175dcce3ed2a3c584bdb5a10b3eb12d1

  get "pages/home"

  get "pages/contact"

     # The priority is based upon order of creation:
     # first created -> highest priority.

     # Sample of regular route:
     #   match 'products/:id' => 'catalog#view'

end
