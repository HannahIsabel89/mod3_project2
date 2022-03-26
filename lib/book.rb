class Book
    @@all = []
    def initialize(attributes)
        attributes.each do |key, value|
            self.class.attr_accessor key
            self.send("#{key}=", value)
        end

        self.class.all << self
    end

    def self.all
        @@all
    end

    def print_book_details
        puts "#{title} - #{price}"
        line_break
        puts "Date published: #{pub_date}"
    end
end