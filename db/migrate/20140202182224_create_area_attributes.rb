class CreateAreaAttributes < ActiveRecord::Migration
  def change
    create_table :area_attributes do |t|
      t.text :name
      t.text :value
      t.integer :area_id

      t.timestamps
    end
  end
end
