class Word < ActiveRecord::Base
  attr_accessible :cloud, :count, :deleted, :text
end
