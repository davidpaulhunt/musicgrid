module Api
  class SessionsController < ApplicationController
    skip_filter :verify_authenticity_token
    skip_filter :ensure_logged_in

    respond_to :json
    
    def new
    end

    def create
      @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
      if @user
        session[:user_id] = @user.id
        @user.generate_token(:native_access_token)
        render template: 'api/users/user_token', user: @user
      else
        render plain: 2
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to login_path, notice: "You logged out!"
    end
  end
end