class AddBrainIdToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :brain_id, :integer
  end
end
