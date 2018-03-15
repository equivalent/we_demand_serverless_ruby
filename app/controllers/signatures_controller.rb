class SignaturesController < ApplicationController
  before_action :set_users_scope, only: [:index, :all]
  before_action :set_users_count, only: [:index, :all]

  def index
    @users = @users.first(18)
  end

  def all

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

  private

  def set_users_scope
    @users = User.order(id: :desc)
  end

  def set_users_count
    @users_count = User.count
  end
end
