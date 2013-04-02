class RemoveClassiferTypeFromBrains < ActiveRecord::Migration
  def up
    #remove_column :brains, :classifer_type
  end

  def down
    #add_column :brains, :classifer_type, :string
  end
end
