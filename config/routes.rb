Rails.application.routes.draw do

  get 'teamevents/index'

  get 'embed/index'

  root 'home#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'share' => 'embed#index'
  get 'eventstanding/:event_id' => 'embed#eventstandings', as: :sharestandings
  get 'eventresults/:event_id' => 'embed#eventresults', as: :shareresults

  # for events
  get 'standings/:event_id' => 'events#showstanding', as: :standing
  
  # set event results
  get 'set/:event_id' => 'events#setresults', as: :set
  post 'set/:event_id' => 'events#createresults'
  delete 'set/:event_id' => 'events#destroyresults'
  
  # set athlete participants
  get 'ae/:event_id' => 'events#showathlete', as: :ae
  post 'ae/:event_id' => 'events#createathlete'
  delete 'ae/:event_id' => 'events#destroyathlete'
  
  # set team participants
  get 'at/:event_id' => 'events#showteam', as: :at
  post 'at/:event_id' => 'events#createteam'
  delete 'at/:event_id' => 'events#destroyteam'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :athletes
	
    resources :teams
    resources :events
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
