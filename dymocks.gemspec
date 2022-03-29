Gem::Specification.new do |s|
    s.name        = 'mod3project'
    s.version     = '0.0.0'
    s.executables << 'project3'
    s.summary     = "Dymocks top ten."
    s.description = "The top ten books from Dymocks scraped and displayed for the user"
    s.authors     = ["Hannah Woodward"]
    s.email       = 'hannahwoodward@hotmail.com'
    s.files       = [
      "lib/cli.rb",
      "lib/book.rb",
      "lib/scraper.rb",
      "config/environment.rb",
      "config/utilities.rb",
    ]
    s.homepage    =
      'https://rubygems.org/gems/hola'
    s.license       = 'MIT'
  end