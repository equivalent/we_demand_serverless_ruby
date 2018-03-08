class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_via_omniauth(provider: auth['provider'], uid: auth['uid'])
    user = User.create_with_omniauth(auth) unless user
    reset_session
    session[:user_id] = user.id
    redirect_to root_path(highlight: user.id), :notice => 'Thank you ! You were added to the list.'
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_path, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
