class FixExtensionName < ActiveRecord::Migration
  def change
    rename_column :photos, :extension, :photo_file
  end
end
