class ListsController < ApplicationController

  def create
    RestClient.post("#{TRELLO_API_URL}/lists",
      {key: API_KEY, token: current_user.trello_token, name: params[:name], idBoard: params[:board_id]})
    return redirect_to board_url(params[:board_id])
  end

end
