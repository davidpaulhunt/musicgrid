class UsersController < ApplicationController

  skip_filter :verify_authenticity_token

  skip_filter :ensure_logged_in, only: [:new, :create]

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
    puts params
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.json { render plain: 1 }
        format.html { redirect_to login_path }
      else
        format.json { render plain: 2 }
        format.html { render :new, notice: "error" }
      end
    end
  end

  def home
  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:email)
    # (:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end