class CaseLogController < ApplicationController

before_action :authenticate_user!

def show_case_log
    @student_id =  current_user.id
    @logs = Log.where({ :student_id => @student_id})

    render("log_templates/list.html.erb")
end

def new_entry
    @student_id =  current_user.id
    
    render("log_templates/blank_form.html.erb")
end

end
