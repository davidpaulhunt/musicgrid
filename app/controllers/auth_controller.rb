class AuthController < ApplicationController

  skip_filter :ensure_logged_in, only: [:facebook, :facebook_callback]

  def facebook
    @user = User.find_or_create_from_auth_hash(auth_hash)
    debugger
    self.current_user = @user
  end

  def facebook_callback
    debugger
    current_user.set_facebook_token(auth_hash.credentials.token)
    redirect_to mygrid_path, notice: "Facebook hooked up!"
  end

  private

  def create_user(auth_hash)
    params = {user: {}}
    params[:user][:email] = auth_hash.email
    params[:user][:username] = "#{auth_hash.first_name}#{auth_hash.last_name}"
    params[:user][:first_name] = auth_hash.first_name
    params[:user][:last_name] = auth_hash.last_name
    params[:user][:password] = password
    params[:user][:password_confirmation] = password
    params
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end