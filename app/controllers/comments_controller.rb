class CommentsController < ApplicationController

  def create
    @park = Park.find(params[:park_id])
    Comment.create(comment_params)
    redirect_to park_path(@park.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, park_id: params[:park_id])
  end

end
