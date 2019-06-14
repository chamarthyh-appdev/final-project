Rails.application.routes.draw do
  
  devise_for :users

  # CREATE
  match("/add_case_log_entry", { :controller => "case_log", :action => "add_new_row", :via => "get" })
  match("/add_case_log_wishlist/:id_to_add", { :controller => "case_log", :action => "add_new_wishlist", :via => "get" })
  # READ
  match("/casebanks", { :controller => "casebanks", :action => "list", :via => "get" })
  match("/casebanks/:id_to_display", { :controller => "casebanks", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_case_log_entry/:id_to_update", { :controller => "case_log", :action => "show_edit_page", :via => "get" })
  match("/update_case_log_entry/:modify_id", { :controller => "case_log", :action => "update_case_log", :via => "get" })



  # DELETE
  match("/delete_case_log_entry/:id_to_remove", { :controller => "case_log", :action => "bye_bye_log", :via => "get" })

  #------------------------------

  match("/", {  :controller => "home_page", :action => "show_home_page", :via => "get"})

  match("/case_log", {:controller => "case_log", :action => "show_case_log", :via => "get"})
  
  match("/new_log_entry", {:controller => "case_log", :action => "new_entry_form", :via => "get"})

# Ignore the below
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
