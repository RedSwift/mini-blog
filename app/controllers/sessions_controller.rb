class SessionsController < ApplicationController
  def index
    @username = User.find_by(id: session[:user_id])
    @post = Post.all.order(created_at: :desc)
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, notice: "Login was successful!"
    else
      flash[:notice] = "Couldn't sign you in. Please check your email and password."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: "Signed out"
  end
end
