class AddNameToBrains < ActiveRecord::Migration
  def change
    add_column :brains, :name, :string
  end
end
