class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.text :name
      t.integer  :user_id
      t.timestamps
    end
  end
end
