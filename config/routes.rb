Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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

  resources :concepts, only: [:index, :show] do
    get '/oral_questions(.:format)', to: 'oral_questions#index_by_concept', as: 'oral_questions'
    get '/written_questions(.:format)', to: 'written_questions#index_by_concept', as: 'written_questions'
    get '/divisions(.:format)', to: 'divisions#index_by_concept', as: 'divisions'
    get '/business_items(.:format)', to: 'business_items#index_by_concept', as: 'business_items'
  end

  resources :people, only: [:index, :show] do
    get '/oral_questions(.:format)', to: 'oral_questions#index_by_person', as: 'oral_questions'
    get '/written_questions(.:format)', to: 'written_questions#index_by_person', as: 'written_questions'
    get '/votes(.:format)', to: 'votes#index_by_person', as: 'votes'
    get '/committees(.:format)', to: 'committees#index_by_person', as: 'committees'
    get '/written_answers(.:format)', to: 'written_answers#index_by_person', as: 'written_answers'
  end

  resources :written_questions, only: [:index, :show]

  resources :oral_questions, only: [:index, :show]

  resources :committees, only: [:index, :show]

  resources :search, only: [:index]

  resources :written_answers, only: [:show]

  resources :houses, only: [:index, :show] do
    get '/oral_questions(.:format)', to: 'oral_questions#index_by_house', as: 'oral_questions'
    get '/written_questions(.:format)', to: 'written_questions#index_by_house', as: 'written_questions'
    get '/divisions(.:format)', to: 'divisions#index_by_house', as: 'divisions'
    get '/people(.:format)', to: 'people#index_by_house', as: 'people'
  end

  resources :divisions, only: [:index, :show] do
    get '/votes(.:format)', to:'votes#index_by_division', as: 'votes'
  end

  resources :constituencies, only: [:index, :show]

  resources :petitions, only: [:index, :show]

  resources :order_papers, only: [:index] do
    get '/business_items(.:format)', to: 'business_items#index_by_order_paper', as: 'business_items'
    get '/business_items/:id(.:format)', to: 'business_items#show', as: 'business_item'
    get '/business_items/:id/edit(.:format)', to: 'business_items#edit', as: 'business_item_edit'
    post '/business_items/:id/edit(.:format)', to: 'business_items#update', as: 'business_item_update'


    # resources :business_items, only: [:index, :show, :edit]
  end

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
