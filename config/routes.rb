Rails.application.routes.draw do
  devise_for :users
  # Routes for the Itemoutfit resource:
  root to: "outfits#index"

  # CREATE
  post("/insert_itemoutfit", { :controller => "itemoutfits", :action => "create" })
          
  # READ
  get("/itemoutfits", { :controller => "itemoutfits", :action => "index" })
  
  get("/itemoutfits/:path_id", { :controller => "itemoutfits", :action => "show" })
  
  # UPDATE
  
  post("/modify_itemoutfit/:path_id", { :controller => "itemoutfits", :action => "update" })
  
  # DELETE
  get("/delete_itemoutfit/:path_id", { :controller => "itemoutfits", :action => "destroy" })

  #------------------------------

  # Routes for the Itemcategory resource:

  # CREATE
  post("/insert_itemcategory", { :controller => "itemcategories", :action => "create" })
          
  # READ
  get("/itemcategories", { :controller => "itemcategories", :action => "index" })
  
  get("/itemcategories/:path_id", { :controller => "itemcategories", :action => "show" })
  
  # UPDATE
  
  post("/modify_itemcategory/:path_id", { :controller => "itemcategories", :action => "update" })
  
  # DELETE
  get("/delete_itemcategory/:path_id", { :controller => "itemcategories", :action => "destroy" })

  #------------------------------

  resources :outfits do
    member do
      patch :increment_compliments
      patch :decrement_compliments
      delete :remove_item
    end
  end
 
  resources :items do
    member do
      patch :increment_compliments
      patch :decrement_compliments
      delete :remove_category
    end
  end

  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
