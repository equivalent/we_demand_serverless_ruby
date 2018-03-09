class SignaturesController < ApplicationController
  def index
    @users = User.all
  end

  def unsign
    if current_user
      current_user.destroy
      reset_session

      flash[:notice] = "You've been removed from this petition :("
      redirect_to root_path
    else
      flash[:notice] = "You need to sign-in first (click the sign button)"
      redirect_to root_path
    end
  end
end
