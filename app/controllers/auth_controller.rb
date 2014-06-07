class AuthController < ApplicationController

  skip_filter :ensure_logged_in, only: [:facebook, :facebook_callback]

  def facebook
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
  end

  def facebook_callback
    user = User.find_by_email(auth_hash.email)
    if user
      session[:user_id] = user.id
      current_user.set_facebook_token(auth_hash.credentials.token)
      redirect_to mygrid_path, notice: "Facebook hooked up!"
    else
      create_user(auth_hash)
    end
  end

  private

  def create_user(auth_hash)
    params = {user: {}}
    params[:user][:email] = auth_hash.email
    params[:user][:username] = "#{auth_hash.first_name}#{auth_hash.last_name}"
    params[:user][:first_name] = auth_hash.first_name
    params[:user][:last_name] = auth_hash.last_name
    params[:user][:password] = "password"
    params[:user][:password_confirmation] = "password"
    User.new(params)
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end