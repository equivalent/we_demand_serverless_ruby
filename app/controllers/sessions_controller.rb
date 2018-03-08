class SessionsController < ApplicationController
  def new
    redirect_to '/auth/github'
  end

  def create
    require 'irb'; binding.irb
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    redirect_to root_path, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_path, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
