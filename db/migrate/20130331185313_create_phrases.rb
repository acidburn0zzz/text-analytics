class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
        t.text :text
        t.string :category

      t.timestamps
    end
    #belongs_to :brain
  end
end
