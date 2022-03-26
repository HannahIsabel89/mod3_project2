require_relative '../config/environment.rb'

class CLI
    def initialize # get the list of categories from webpage 
        system("clear")
        loading_message
        Scraper.new.get_best_sellers
    end

    def loading_message #message while the user is waiting for the app to load
        puts "A reader lives a thousand lives before he dies . . . The man who never reads lives only one."
        new_line
        puts "Please wait a moment while we load your next book adventure."
    end
    
    def start
        clear
        puts "Welcome to the Dymocks Top Ten CLI app."
        puts "Here you can find the top tem books on the Dymocks site, and further information about each book."
        new_line
        Book.print_top_ten
        new_line
        puts "Select the book you wish to know more about by typing the number in the menu."

        response = gets.strip.to_i

        if response > Book.all.count || response < 1
            puts "I didn't understand that, try again."
            sleep(2)
            system('clear')
            start
        else
            clear
            selected_book = Book.all[response - 1]
            p selected_book.url
            book = Scraper.book_details(selected_book.url)
            selected_book.price = book[:price]
            selected_book.pub_date = book[:pub_date]
            selected_book.print_book_details
            new_line
            new_line
            puts "In 5 seconds you will be taken back to the main menu."
            #sleep(5)
            #start   
        end
    end
end