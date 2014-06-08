class Album < ActiveRecord::Base
  has_many :swipes

  def self.get_album_info(params)
    artist = params[:artist]
    album = params[:album]
    api_key = Rails.application.secrets.lastfm_key
    request = HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=album.getInfo&api_key=#{api_key}&artist=#{artist}&album=#{album}&format=json")
    request
  end

end
