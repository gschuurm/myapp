class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.datetime :timestamp
      t.string :extension
      t.text :description

      t.timestamps
    end
  end
end
