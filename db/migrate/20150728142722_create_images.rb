class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      
      t.string :image
      t.integer :mosaicdb_id
      t.string  :mosaicdb_id_string
      
      t.timestamps null: false
    end
  end
end
