class LogsController < ApplicationController
  def list
    @logs = Log.all

    render("log_templates/list.html.erb")
  end

  def details
    @log = Log.where({ :id => params.fetch("id_to_display") }).first

    render("log_templates/details.html.erb")
  end

  def blank_form
    @log = Log.new

    render("log_templates/blank_form.html.erb")
  end

  def save_new_info
    @log = Log.new

    @log.student_id = params.fetch("student_id")
    @log.case_id = params.fetch("case_id")
    @log.given_by = params.fetch("given_by")
    @log.feedback = params.fetch("feedback")

    if @log.valid?
      @log.save

      redirect_to("/logs", { :notice => "Log created successfully." })
    else
      render("log_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @log = Log.where({ :id => params.fetch("id_to_prefill") }).first

    render("log_templates/prefilled_form.html.erb")
  end

  def save_edits
    @log = Log.where({ :id => params.fetch("id_to_modify") }).first

    @log.student_id = params.fetch("student_id")
    @log.case_id = params.fetch("case_id")
    @log.given_by = params.fetch("given_by")
    @log.feedback = params.fetch("feedback")

    if @log.valid?
      @log.save

      redirect_to("/logs/" + @log.id.to_s, { :notice => "Log updated successfully." })
    else
      render("log_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @log = Log.where({ :id => params.fetch("id_to_remove") }).first

    @log.destroy

    redirect_to("/logs", { :notice => "Log deleted successfully." })
  end
end
