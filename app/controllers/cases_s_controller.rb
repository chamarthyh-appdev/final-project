class CasesSController < ApplicationController
  def list
    @cases_s = Case.all

    render("cases__templates/list.html.erb")
  end

  def details
    @cases_ = Case.where({ :id => params.fetch("id_to_display") }).first

    render("cases__templates/details.html.erb")
  end

  def blank_form
    @cases_ = Case.new

    render("cases__templates/blank_form.html.erb")
  end

  def save_new_info
    @cases_ = Case.new

    @cases_.title = params.fetch("title")
    @cases_.difficulty = params.fetch("difficulty")
    @cases_.is_brainstorm = params.fetch("is_brainstorm", false)
    @cases_.num_exhibits = params.fetch("num_exhibits")
    @cases_.casebook_id = params.fetch("casebook_id")
    @cases_.is_math_heavy = params.fetch("is_math_heavy")
    @cases_.case_type = params.fetch("case_type")
    @cases_.industry = params.fetch("industry")
    @cases_.is_interviewer_led = params.fetch("is_interviewer_led", false)

    if @cases_.valid?
      @cases_.save

      redirect_to("/cases_s", { :notice => "Cases  created successfully." })
    else
      render("cases__templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @cases_ = Case.where({ :id => params.fetch("id_to_prefill") }).first

    render("cases__templates/prefilled_form.html.erb")
  end

  def save_edits
    @cases_ = Case.where({ :id => params.fetch("id_to_modify") }).first

    @cases_.title = params.fetch("title")
    @cases_.difficulty = params.fetch("difficulty")
    @cases_.is_brainstorm = params.fetch("is_brainstorm", false)
    @cases_.num_exhibits = params.fetch("num_exhibits")
    @cases_.casebook_id = params.fetch("casebook_id")
    @cases_.is_math_heavy = params.fetch("is_math_heavy")
    @cases_.case_type = params.fetch("case_type")
    @cases_.industry = params.fetch("industry")
    @cases_.is_interviewer_led = params.fetch("is_interviewer_led", false)

    if @cases_.valid?
      @cases_.save

      redirect_to("/cases_s/" + @cases_.id.to_s, { :notice => "Cases  updated successfully." })
    else
      render("cases__templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @cases_ = Case.where({ :id => params.fetch("id_to_remove") }).first

    @cases_.destroy

    redirect_to("/cases_s", { :notice => "Cases  deleted successfully." })
  end
end
