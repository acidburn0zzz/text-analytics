class Brain < ActiveRecord::Base
  # attr_accessible :title, :body
    attr_accessible :classifier_type, :name
    has_many :phrases
end
