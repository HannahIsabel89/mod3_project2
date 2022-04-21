class User
   attr_accessor :fave_books 

    def initialize
        @fave_books = []
    end

    def set_fave_books(selected_book)
        fave_books << selected_book
    end

    def print_saved_books
        @fave_books.each do |book|
            puts "Written by: #{book.author}"
            puts "Date published: #{book.title}"
        end
    end
end