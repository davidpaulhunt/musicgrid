class UsersController < ApplicationController

  skip_filter :ensure_logged_in, only: [:new, :create]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new, notice: "Oops, something went wrong. Please try again."
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end

end