class UsersController < ApplicationController
  before_action :require_no_user!, only: [:new, :create]

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      login_user!(user)
      redirect_to boards_url
    else
      flash.now[:errors] << user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
