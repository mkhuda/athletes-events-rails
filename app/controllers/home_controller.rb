class HomeController < ApplicationController
  
  def index
  	unless !logged_in? 
      redirect_to login_path
    end
  end

end
