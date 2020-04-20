class SyncsController < ApplicationController

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    current_user.trello_token = params[:trello_token]
    if current_user.save
      render :index
    else
      flash.now[:errors] = ["Trello Authentication Failed"]
      render :index
    end
  end

  def destroy
  end

end
# nil
