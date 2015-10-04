class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: [current_user.id, current_user.friends.pluck(:id)])
    @posts = Post.where(user_id: [User.first.id, User.first.friends.pluck(:id)])
  end

  def new
    @post = Post.new
    @post.pictures.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
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
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
    commontator_thread_show(@post)
  end

  def delete
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:content, :accessible_by, pictures_attributes: [:collage])
  end
end
