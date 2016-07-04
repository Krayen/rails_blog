class PostsController < ApplicationController
  def index
  end
  def show
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to root_path
    else
      @posts = Post.all.order(created_at: :desc)
      render "home/index"
    end
  end



  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
