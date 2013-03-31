class CreateBrains < ActiveRecord::Migration
  def change
    create_table :brains do |t|
        t.text :classifier


      t.timestamps
    end

    #has_many :phrases
  end
end
