class WelcomeController < ApplicationController
  def index
    #layout "dashboard", :only => [ :index, :how ]
    render(:layout => "layouts/dashboard")
  end
end
