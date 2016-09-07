class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end

end
