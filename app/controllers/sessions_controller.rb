class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    if user = User.find_via_omniauth(provider: auth['provider'], uid: auth['uid'])
      notice_msg = 'You are already in the list ;)'
    else
      user = User.create_with_omniauth(auth)
      notice_msg = 'Thank you ! You were added to the list.'
    end
    reset_session
    session[:user_id] = user.id
    redirect_to root_path(highlight: user.id), :notice => notice_msg
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_path, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
