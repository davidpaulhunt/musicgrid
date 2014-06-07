class LastfmController < ApplicationConroller

  def get_album_info
    artist = params[:artist]
    album = params[:album]
    request = HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=album.getInfo&api_key=#{api_key}&artist=#{artist}&album=#{album}&format=json')
    puts request
  end

  private

  def api_key
    @api_key = Rails.application.secrets.lastfm_key
  end

end