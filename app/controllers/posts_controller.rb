class PostsController < ApplicationController

  def index
    @posts = Post.all.reverse_order
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

    def post_params
      params.require(:post).permit(:text)
    end
end
