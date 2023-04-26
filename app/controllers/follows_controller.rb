class FollowsController < ApplicationController
  before_action :require_login

  def create
    current_user.follow(params[:followed_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:followed_id])
    redirect_to request.referer
  end
end
