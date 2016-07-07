class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:title, :body))

    redirect_to post_path(@post)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end
end
