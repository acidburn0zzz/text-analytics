xml.instruct!
xml.results do
    @res.each do |result|
        xml.related result
    end 
end
