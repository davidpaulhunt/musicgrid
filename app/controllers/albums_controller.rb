class AlbumsController < ApplicationController
  skip_filter :verify_authenticity_token
  skip_filter :ensure_logged_in

  def create
    request = Album.get_album_info(album_params)
    @album = Album.new(build_album(request["album"]))
    respond_to do |format|
      if @album.save
        format.json { render @album }
        format.html {}
      else
        render plain: 2
      end
    end
  end


  private

  def album_params
    params.require(:album).permit(:artist, :album)
  end

  def build_album(album)
    @album = {}
    @album[:name] = album["name"]
    @album[:artist] = album["artist"]
    @album[:lastfm_url] = album["url"]
    @albumt[:image_url] = album["image"].first.first[1]
    @album
  end

end