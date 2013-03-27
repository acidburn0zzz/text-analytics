class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :text
      t.integer :count
      t.boolean :deleted
      t.string :cloud

      t.timestamps
    end
  end
end
