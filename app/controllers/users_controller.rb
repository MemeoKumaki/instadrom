class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @followers = Follow.where(followed_id: @user.id)
    @followed_users = Follow.where(follower_id: @user.id)
  end


  def follow
    other_user = User.find(params[:id])
    current_user.follow!(other_user)
    redirect_to :back
  end

  def unfollow
    other_user = User.find(params[:id])
    current_user.unfollow!(other_user)
    redirect_to :back
  end
end
