class Phrase < ActiveRecord::Base
  # attr_accessible :title, :body
    attr_accessible :text, :category, :brain_id
    belongs_to :brain
end
