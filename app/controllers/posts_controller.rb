class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
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
      render 'home/index'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
