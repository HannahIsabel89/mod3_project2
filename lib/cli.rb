require_relative '../config/environment.rb'

class CLI

    def initialize
    
    def start
        puts "Hi"
        Scraper.new.get_best_sellers
    end
end