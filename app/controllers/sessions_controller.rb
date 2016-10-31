class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name: params[:name])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        return redirect_to users_path
      end
    end
    flash[:error] = "Try again dingus!"
    redirect_to login_path
  end

  def destroy
    session.clear
    redirect_to users_path
  end

end
