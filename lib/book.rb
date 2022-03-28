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

    def self.print_top_ten # list the books in a menu
        all.each.with_index(1) {|book, i| puts "#{i}. #{book.title}"}
    end

    def print_book_details
        puts "#{title} - #{price}"
        line_break
        puts "Written by: #{author}"
        puts "Date published: #{pub_date}"
    end

    def book_blurb
        puts "About the chosen book - #{title}"
        line_break
        new_line
        puts "#{blurb}"
    end
end