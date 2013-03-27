class ChangeTextToString < ActiveRecord::Migration
  def up
      change_column :words, :text, :text
      change_column :words, :cloud, :text
  end

  def down
      drop_table :words
  end
end
