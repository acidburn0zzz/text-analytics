module CloudHelper
    def scale(count)
        min = 10
        max = 120.0
        (((max - min)/(@words.first.count))*(count - @words.last.count) + min).to_i
    end
end
