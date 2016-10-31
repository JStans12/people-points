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
    @user.image_link = nil if @user.image_link == ""
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:error] = "Account Creation Failed"
      redirect_to login_path
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.points >= 5 && @user.tokens >= 2
      @user.reward
      @user.charge
      @user.save
      flash[:success] = "You got a #{@user.most_recent_reward}! #{reward_message}"
      redirect_to users_path

    else
      flash[:error] = "You need 5 points and 2 tokens for a reward!"
      redirect_to users_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :image_link, :password, :password_confirmation)
  end

  def reward_message
    ["Good for you!", "Aren't you special!", "OMG Wow!", "Conratulations!", "Best day ever!"].sample
  end
end
