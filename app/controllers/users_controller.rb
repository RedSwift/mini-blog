class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to home_path, notice: "Sign up complete! Please login!"
    else
      render "new", notice: "Sign up failed! Please contact administrator."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
