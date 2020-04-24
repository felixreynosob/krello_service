class WelcomeController < ApplicationController
  def index
    if logged_in?
      return redirect_to boards_url 
    end
    render :index
  end
end
