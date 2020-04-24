class BoardsController < ApplicationController
  before_action :require_user!

  helper_method :trello_get_cards_from_list

  def index
    return (redirect_to user_url(current_user)) unless current_user.is_trello_connected?
    @trello_personal_boards = trello_personal_boards
    render :index
  end

  def show
    return (redirect_to user_url(current_user)) unless current_user.is_trello_connected?
    @board = trello_get_board(params[:id])
    @lists_on_board = trello_get_lists_from_board(params[:id])
    render :show
  end

  private

  def trello_username
    response = JSON.parse(
      RestClient.get("#{TRELLO_API_URL}/members/me",
        {params: {key: API_KEY, token: current_user.trello_token}}))

    @trello_user_id = response['username']
  end

  def trello_personal_boards
    JSON.parse(
      RestClient.get("#{TRELLO_API_URL}/members/#{trello_username}/boards",
        {params: {key: API_KEY, token: current_user.trello_token}}))
  end

  def trello_get_board(id)
    JSON.parse(
      RestClient.get("#{TRELLO_API_URL}/boards/#{id}",
        {params: {key: API_KEY, token: current_user.trello_token}}))
  end

  def trello_get_lists_from_board(id)
    JSON.parse(
      RestClient.get("#{TRELLO_API_URL}/boards/#{id}/lists",
        {params: {key: API_KEY, token: current_user.trello_token}}))
  end

  def trello_get_cards_from_list(id)
    JSON.parse(
      RestClient.get("#{TRELLO_API_URL}/lists/#{id}/cards",
        {params: {key: API_KEY, token: current_user.trello_token}}))
  end
end
