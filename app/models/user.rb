class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :username


  def set_facebook_token(token)
    self.facebook_token = token
    self.save!
  end

end
