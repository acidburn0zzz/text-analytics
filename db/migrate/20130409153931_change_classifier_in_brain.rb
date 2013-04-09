class ChangeClassifierInBrain < ActiveRecord::Migration
  def up
      change_column :brains, :classifier, :binary
  end

  def down
      change_column :brains, :classifier, :text
  end
end
