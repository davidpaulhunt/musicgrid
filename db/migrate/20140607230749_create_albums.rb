class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :artist
      t.string :last_fm_url
      t.string :image_url

      t.timestamps
    end
  end
end
