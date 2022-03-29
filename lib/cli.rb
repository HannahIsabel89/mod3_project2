require_relative '../config/environment.rb'

class CLI
    def initialize # get the list of categories from webpage 
        system("clear")
        loading_message
        sleep(3)
        Scraper.new.get_best_sellers
    end

    def loading_message #message while the user is waiting for the app to load
        puts "A reader lives a thousand lives before he dies . . . The man who never reads lives only one."
        new_line
        puts "Please wait a moment while we load your next book adventure."
    end
    
    def start
        clear
        puts "Welcome to the Dymocks Top Ten Books CLI app."
        puts "Here you can find the top tem books on the Dymocks site, and further information about each book."
        new_line
        Book.print_top_ten
        new_line
        puts "Select the book you wish to know more about by typing the number in the menu."
        puts "Or type '0' to exit."

        response = gets.strip.to_i

        if response == 0 
            system('exit') 

        elsif response > Book.all.count || response < 1
            puts "I didn't understand that, try again."
            sleep(2)
            system('clear')
            start

        else
            clear
            selected_book = Book.all[response - 1]
            book = Scraper.book_details(selected_book.url)
            selected_book.price = book[:price]
            selected_book.pub_date = book[:pub_date]
            selected_book.blurb = book[:blurb]
            selected_book.print_book_details
            new_line
            puts "Type [y]es to read the plotline, or [n]o to return to the main menu."

            further_info(selected_book)
        end
    end

    def further_info(selected_book)
        response_2 = gets.strip

        if response_2.downcase == "y"
            clear
            selected_book.book_blurb 
            new_line
            puts "In 10 seconds you will be redirected to the main menu."
            sleep(10)
            start

        else 
            clear
            puts "You will now be taken back to the main menu."
            sleep(4)
            start         
        end
    end
end