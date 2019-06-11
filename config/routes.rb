Rails.application.routes.draw do
  
  devise_for :users

  # Routes for the Casebank resource:

  # CREATE
  match("/new_casebank_form", { :controller => "casebanks", :action => "blank_form", :via => "get" })
  match("/insert_casebank_record", { :controller => "casebanks", :action => "save_new_info", :via => "post" })

  # READ
  match("/casebanks", { :controller => "casebanks", :action => "list", :via => "get" })
  match("/casebanks/:id_to_display", { :controller => "casebanks", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_casebank_form/:id_to_prefill", { :controller => "casebanks", :action => "prefilled_form", :via => "get" })
  match("/update_casebank_record/:id_to_modify", { :controller => "casebanks", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_casebank/:id_to_remove", { :controller => "casebanks", :action => "remove_row", :via => "get" })

  #------------------------------

  match("/", {  :controller => "home_page", :action => "show_home_page", :via => "get"})

  match("/case_log", {:controller => "case_log", :action => "show_case_log", :via => "get"})
  
  match("/new_log_entry", {:controller => "case_log", :action => "new_entry", :via => "get"})

# Ignore the below
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
