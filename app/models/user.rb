class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  has_many :swipes
  has_many :albums, through: :swipes

  def get_likes
    self.albums.where(preference_id: 1)
  end

  def set_facebook_token(token)
    self.facebook_token = token
    self.save!
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64(8)
    end while User.exists?(column => self[column])
    self.save
  end

end
