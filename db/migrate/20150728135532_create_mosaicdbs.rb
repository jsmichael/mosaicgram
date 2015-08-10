class CreateMosaicdbs < ActiveRecord::Migration
  def change
    create_table :mosaicdbs do |t|
      
      t.string :titletag
      
      
      t.timestamps null: false
    end
  end
end
