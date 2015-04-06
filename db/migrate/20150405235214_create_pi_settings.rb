class CreatePiSettings < ActiveRecord::Migration
  def change
    create_table :pi_settings do |t|
      t.boolean :display
      t.boolean :capture
      t.integer :album

      t.timestamps
    end
  end
end
