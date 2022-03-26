class Scraper
    BASE_URL = "https://www.dymocks.com.au/"

    def get_page(url)
        Nokogiri::HTML(open(url))
    end

    def get_best_sellers  # gets  categories - STEP ONE
        doc = get_page(BASE_URL)

        element = doc.css('.product-list-content-table')
        list_items = element.css('.product-list-content-item')
        list_items.each do |category| 
            #print " = "
            title = category.css('a').text.strip 
            author = category.css('.product-author').text.strip 
            url = category.css('a')
            url = url.attr("href").value
            url = url.include?("https") ? url : "#{BASE_URL}#{url}"
            book = Book.new({title: title, author: author, url: url, price: nil, pub_date: nil})
            self.book_details(url)
        end
    end

    def book_details(url)
        doc = get_page(url)
        element = doc.css('.product-details-summary')
        #p element
        price = element.css('.product-ecommerce-buy-price').text.strip.split[0].downcase
        p price
        pub_date = element.css('.product-details-publication-date').text.strip 
        p pub_date
        {price: price, pub_date: pub_date}
    end
end