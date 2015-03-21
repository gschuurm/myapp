class CreateAlbumsPhotos < ActiveRecord::Migration
  def change
    create_table :albums_photos do |t|
      t.integer :album_id
      t.integer :photo_id
    end

    add_index :albums_photos, [:album_id, :photo_id], :unique => true
  end
end
