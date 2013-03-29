class AddStemToWords < ActiveRecord::Migration
  def change
    add_column :words, :stem, :string
  end
end
