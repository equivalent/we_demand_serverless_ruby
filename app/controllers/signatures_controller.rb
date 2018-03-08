class SignaturesController < ApplicationController
  def index
  end

  def unsign
    authorize_user!
    current_user.destroy
    sign_out(current_user)

    flash[:notice] = "You've been removed from this petition"
  end
end
