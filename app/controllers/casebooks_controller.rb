class CasebooksController < ApplicationController
  def list
    @casebooks = Casebook.all

    render("casebook_templates/list.html.erb")
  end

  def details
    @casebook = Casebook.where({ :id => params.fetch("id_to_display") }).first

    render("casebook_templates/details.html.erb")
  end

  def blank_form
    @casebook = Casebook.new

    render("casebook_templates/blank_form.html.erb")
  end

  def save_new_info
    @casebook = Casebook.new

    @casebook.casebook_name = params.fetch("casebook_name")
    @casebook.url = params.fetch("url")

    if @casebook.valid?
      @casebook.save

      redirect_to("/casebooks", { :notice => "Casebook created successfully." })
    else
      render("casebook_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @casebook = Casebook.where({ :id => params.fetch("id_to_prefill") }).first

    render("casebook_templates/prefilled_form.html.erb")
  end

  def save_edits
    @casebook = Casebook.where({ :id => params.fetch("id_to_modify") }).first

    @casebook.casebook_name = params.fetch("casebook_name")
    @casebook.url = params.fetch("url")

    if @casebook.valid?
      @casebook.save

      redirect_to("/casebooks/" + @casebook.id.to_s, { :notice => "Casebook updated successfully." })
    else
      render("casebook_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @casebook = Casebook.where({ :id => params.fetch("id_to_remove") }).first

    @casebook.destroy

    redirect_to("/casebooks", { :notice => "Casebook deleted successfully." })
  end
end
