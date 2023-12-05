class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "送信が完了しました。"
      redirect_to @post
    else
      render 'new'
    end
  end

  def index
    #postidの降順で表示
    @posts = Post.all.order(id: "DESC")
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def adminshow
    @post = Post.find_by(id: params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
