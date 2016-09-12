class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  
  include LikesHelper

  def index
    @posts = Post.all
    @post = Post.new
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def like
    @like = Like.new(like_params)
    if like_exists?(@like.user_id, @like.post_id)
      old_like = Like.where(user_id: @like.user_id, post_id: @like.post_id).take
      Like.destroy(old_like.id)
    else
      @like.save
    end
    redirect_to :back
  end

  def destroy
    @post = Post.destroy(params[:id])
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @comment = Comment.new
  end

  private


  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end

  def post_params
    params.require(:post).permit(:body, :user_id, :image)
  end

  def correct_user
    @post = Post.find(params[:id])
    redirect_to(root_path) unless current_user == @post.user
  end
end
