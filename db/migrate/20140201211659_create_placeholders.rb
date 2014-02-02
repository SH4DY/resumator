class CreatePlaceholders < ActiveRecord::Migration
  def change
    create_table :placeholders do |t|
      t.integer :position
      t.integer :resume_id
      t.integer :area_id

      t.timestamps
    end
  end
end
