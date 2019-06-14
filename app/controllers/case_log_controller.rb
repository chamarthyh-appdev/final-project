class CaseLogController < ApplicationController

before_action :authenticate_user!

def show_case_log
    @student_id =  current_user.id
    @logs = Log.where({ :student_id => @student_id}).order(practice_date: :asc)
    

    render("log_templates/list.html.erb")
end

def new_entry_form
    @student_id =  current_user.id
    
    render("log_templates/blank_form.html.erb")
end

def add_new_row
    entry = Log.new
    entry.student_id =  current_user.id
    entry.case_id = params.fetch("case_id")
    entry.feedback = params.fetch("feedback")
    entry.given_by = params.fetch("given_by")
    entry.practice_date = params.fetch("practice_date")
    
    entry.save
    
    redirect_to("/case_log")
end

def bye_bye_log
    entry = Log.where({ :id => params.fetch("id_to_remove")}).at(0)
    entry.destroy
    
    redirect_to("/case_log")
end


def show_edit_page
    @log_entry = Log.where({:id => params.fetch("id_to_update")}).first
    
    render("log_templates/edit_form.html.erb")
end 

def update_case_log
    row = Log.where({ :id => params.fetch("modify_id")}).at(0)
    row.given_by = params.fetch("given_by")
    row.feedback = params.fetch("feedback")
    row.practice_date = params.fetch("practice_date")
    
    row.save
    
    redirect_to("/case_log")
end 

def add_new_wishlist
    entry = Log.new
    entry.student_id =  current_user.id
    entry.case_id = params.fetch("id_to_add")

    entry.save
    
    redirect_to("/case_log")
end

end
