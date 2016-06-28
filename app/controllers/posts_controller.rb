class PostsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]
  before_action :your_post?, except: [:index, :new, :create]

  def index
    @post = Post.all
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to [current_user, @post], notice: "successfully created"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to user_post_path(current_user, @post), notice: "successfully updated"
    else
      render "edit", notice: "Not successful!"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_posts_path(session[:user_id]), notice: "successfully destroyed"
  end

private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def your_post?
    # incomplete - need to compare to user_id from url.
      @post = Post.find(params[:id])
     redirect_to home_path, notice: "This post doesn't belong to you!" unless @post.user == current_user

  end
end
