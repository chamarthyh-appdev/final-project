class HomePageController < ApplicationController

#  before_action :authenticate_user!, :only [:show_home_page]

def show_home_page
    render("other_templates/home_page.html.erb")
end

end
