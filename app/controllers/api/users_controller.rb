module Api
  class UsersController < ApplicationController

    skip_filter :verify_authenticity_token

    skip_filter :ensure_logged_in

    before_action :set_user, only: [:find, :show, :edit, :update, :destroy]

    respond_to :json

    def new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to api_login_path(api_session_params(user_params))
      else
        render plain: 2
      end
    end

    def home
    end

    def show
    end

    def find
    end

    def edit
    end

    def update
      if @user.update_attributes(user_params)
        render @user
      else
        render plain: 2
      end
    end

    def destroy
    end

    private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end

    def api_session_params(saved_user)
      new_params = {}
      new_params[:email] = saved_user[:email]
      new_params[:password] = saved_user[:password]
      new_params
    end

    def set_user
      @user = User.find_by_native_access_token(params[:token])
    end

  end
end