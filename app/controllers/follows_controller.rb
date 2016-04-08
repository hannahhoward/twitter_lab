class FollowsController < ApplicationController
  def create
    @follow = Follow.new(follow_params)
    @follow.follower = current_user
    @follow.save
    redirect_to @follow.followee
  end

  def destroy
    @follow = Follow.find(params[:id])
    @followee = @follow.followee
    @follow.destroy
    redirect_to @followee
  end

  def follow_params
    params.require(:follow).permit(:followee_id)
  end
end
