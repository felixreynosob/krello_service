class SyncsController < ApplicationController
  def new
    render :new
  end

  def create
    current_user.trello_token = params[:trello_token]
    if current_user.save
      return redirect_to boards_url
    else
      flash.now[:errors] = ["Trello Authentication Failed"]
      redirect_to user_url(current_user)
    end
  end

  def destroy
    current_user.trello_token = nil
    current_user.save
  end
end
