class DropAlbumsPhotosTable < ActiveRecord::Migration
  def change
    drop_table :albums_photos
  end
end
