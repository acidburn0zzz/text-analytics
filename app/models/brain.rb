class Brain < ActiveRecord::Base
  # attr_accessible :title, :body
    has_many :phrases
end
