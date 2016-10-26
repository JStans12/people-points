class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:error] = "Try again dingus!"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to users_path
  end

end
