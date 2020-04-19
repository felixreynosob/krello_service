class BoardsController < ApplicationController
  before_action :require_user!

  def index
    render :index
  end

  def show

    render :show
  end


end
