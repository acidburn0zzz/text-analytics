class Brain < ActiveRecord::Base
  # attr_accessible :title, :body
    attr_accessible :classifier_type, :name
    has_many :phrases
    
    def categories
        categories = []
        if self.classifier_type == 'LSI'
            c = Marshal.load self.classifier
            c.items.each do |item|
                c.categories_for(item).each do |item|
                    categories << item
                end
            end
        end
        return categories.uniq
    end
end
