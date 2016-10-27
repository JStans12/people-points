class EndorsementsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @endorsement = Endorsement.new
  end

  def create
    @user = User.find(params[:user_id])
    @endorsement = @user.endorsements.new(endorsement_params)
    if @endorsement.save
      @user.points += 2
      @user.save
      current_user.points -= 1
      current_user.tokens += 1
      current_user.save
      redirect_to user_path(@user)
    else
      flash[:error] = "Endorsement must have text."
      render :new
    end
  end

  private

  def endorsement_params
    params.require(:endorsement).permit(:body, :endorser)
  end

end
