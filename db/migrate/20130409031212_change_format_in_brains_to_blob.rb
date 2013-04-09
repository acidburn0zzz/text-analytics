class ChangeFormatInBrainsToBlob < ActiveRecord::Migration
  def change
      change_column :brains, :classifier, :binary
  end

  def down
  end
end
