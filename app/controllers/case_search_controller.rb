class CaseSearchController < ApplicationController

    def show_full_list
        @q = Casebank.ransack(params[:q])
        @cases_displayed = @q.result
        
        # binding.pry
        render("list_templates/all_case_list.html.erb")
    end

end
