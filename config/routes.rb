Rails.application.routes.draw do
  
  root to: "users#index"
  
  # Routes for the Address resource:
  # CREATE
  get "/addresses/new", :controller => "addresses", :action => "new"
  post "/create_address", :controller => "addresses", :action => "create"

  # READ
  get "/addresses", :controller => "addresses", :action => "index"
  get "/addresses/:id", :controller => "addresses", :action => "show"

  # UPDATE
  get "/addresses/:id/edit", :controller => "addresses", :action => "edit"
  post "/update_address/:id", :controller => "addresses", :action => "update"

  # DELETE
  get "/delete_address/:id", :controller => "addresses", :action => "destroy"
  #------------------------------

  # Routes for the Shipment resource

  # CREATE
  get "/shipments/new", :controller => "shipments", :action => "new"
  post "/create_shipment", :controller => "shipments", :action => "create"

  # READ
  get "/shipments", :controller => "shipments", :action => "index"
  get "/shipments/:id", :controller => "shipments", :action => "show"

  # UPDATE
  get "/shipments/:id/edit", :controller => "shipments", :action => "edit"
  post "/update_shipment/:id", :controller => "shipments", :action => "update"

  # DELETE
  get "/delete_shipment/:id", :controller => "shipments", :action => "destroy"
  #------------------------------

  # Routes for the Order resource:
  # CREATE
  get "/orders/new", :controller => "orders", :action => "new"
  post "/create_order", :controller => "orders", :action => "create"

  # READ
  get "/orders", :controller => "orders", :action => "index"
  get "/orders/:id", :controller => "orders", :action => "show"

  # UPDATE
  get "/orders/:id/edit", :controller => "orders", :action => "edit"
  post "/update_order/:id", :controller => "orders", :action => "update"

  # DELETE
  get "/delete_order/:id", :controller => "orders", :action => "destroy"
  #------------------------------

  # Routes for the Cycle resource:
  # CREATE
  get "/cycles/new", :controller => "cycles", :action => "new"
  post "/create_cycle", :controller => "cycles", :action => "create"

  # READ
  get "/cycles", :controller => "cycles", :action => "index"
  get "/cycles/:id", :controller => "cycles", :action => "show"

  # UPDATE
  get "/cycles/:id/edit", :controller => "cycles", :action => "edit"
  post "/update_cycle/:id", :controller => "cycles", :action => "update"

  # DELETE
  get "/delete_cycle/:id", :controller => "cycles", :action => "destroy"
  #------------------------------




  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
  
  
  # Routes for user resource:

  # READ
  # get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"
  
end
