class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find(user_id)
  end

  private

  def user_id
    params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
