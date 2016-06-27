class PostsController < ApplicationController
  def index
    @username = User.find_by(id: session[:user_id])
  end

  def show
  end

  def new
  end

  def edit
  end
end
