class AddClassifierTypeToBrains < ActiveRecord::Migration
  def change
    add_column :brains, :classifier_type, :string
  end
end
