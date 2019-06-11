class CasebanksController < ApplicationController
  def list
    # @casebanks = Casebank.all
    
        @q = Casebank.ransack(params[:q])
        @cases_displayed = @q.result
        
        @difficulty_dist = Casebank.distinct.pluck(:difficulty)
        
        render("casebank_templates/all_case_list.html.erb")

    # render("casebank_templates/list.html.erb")
  end

  def details
    @casebank = Casebank.where({ :id => params.fetch("id_to_display") }).first

    render("casebank_templates/details.html.erb")
  end

  def blank_form
    @casebank = Casebank.new

    render("casebank_templates/blank_form.html.erb")
  end

  def save_new_info
    @casebank = Casebank.new

    @casebank.title = params.fetch("title")
    @casebank.difficulty = params.fetch("difficulty")
    @casebank.is_brainstorm = params.fetch("is_brainstorm", false)
    @casebank.num_exhibits = params.fetch("num_exhibits")
    @casebank.casebook_id = params.fetch("casebook_id")
    @casebank.is_math_heavy = params.fetch("is_math_heavy")
    @casebank.case_type = params.fetch("case_type")
    @casebank.industry = params.fetch("industry")
    @casebank.is_interviewer_led = params.fetch("is_interviewer_led", false)

    if @casebank.valid?
      @casebank.save

      redirect_to("/casebanks", { :notice => "Casebank created successfully." })
    else
      render("casebank_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @casebank = Casebank.where({ :id => params.fetch("id_to_prefill") }).first

    render("casebank_templates/prefilled_form.html.erb")
  end

  def save_edits
    @casebank = Casebank.where({ :id => params.fetch("id_to_modify") }).first

    @casebank.title = params.fetch("title")
    @casebank.difficulty = params.fetch("difficulty")
    @casebank.is_brainstorm = params.fetch("is_brainstorm", false)
    @casebank.num_exhibits = params.fetch("num_exhibits")
    @casebank.casebook_id = params.fetch("casebook_id")
    @casebank.is_math_heavy = params.fetch("is_math_heavy")
    @casebank.case_type = params.fetch("case_type")
    @casebank.industry = params.fetch("industry")
    @casebank.is_interviewer_led = params.fetch("is_interviewer_led", false)

    if @casebank.valid?
      @casebank.save

      redirect_to("/casebanks/" + @casebank.id.to_s, { :notice => "Casebank updated successfully." })
    else
      render("casebank_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @casebank = Casebank.where({ :id => params.fetch("id_to_remove") }).first

    @casebank.destroy

    redirect_to("/casebanks", { :notice => "Casebank deleted successfully." })
  end
end
