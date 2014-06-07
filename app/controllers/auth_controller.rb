class AuthController < ApplicationController

  def facebook
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
  end

  def facebook_callback
    current_user.set_facebook_token(auth_hash.credentials.token)
    redirect_to mygrid_path, notice: "Facebook hooked up!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end