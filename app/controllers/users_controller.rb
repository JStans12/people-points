class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.points = 10
    @user.tokens = 0
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:failure] = "Account Creation Failed"
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image_link, :password, :password_confirmation)
  end
end
