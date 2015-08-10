class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :mosaicdb_id
      t.string :username
      t.string :content
      t.string :mosaicdb_id_string
      t.timestamps null: false
    end
  end
end
