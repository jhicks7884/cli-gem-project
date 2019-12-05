class Projects::Unknown
  attr_accessor :name, :description, :url

    def self.today

        self.scrape_unknown

    end

    def self.scrape_unknown
        unknown = []

        unknown << self.scrape_sci_news
        unknown << self.scrape_sci
        unknown << self.scrape_project
        unknown
    end

    def self.scrape_sci_news

        doc = Nokogiri::HTML(open('http://www.sci-news.com//'))

        unknown = self.new
        unknown.name = doc.search("#main > div > div.box.block1 > div > div.block > div > article > h3 > a").text.strip
        unknown.description = doc.search("#main > div > div.box.block1 > div > div.block > div > article > div > p").text.strip
        unknown.url = "click on link to read more "  "http://www.sci-news.com ".strip

        unknown
    end

    def self.scrape_sci

        doc = Nokogiri::HTML(open('http://www.sci-news.com/space/solar-wind-outer-heliosphere-new-horizons-07870.html'))

        unknown = self.new
        unknown.name = doc.search("#content > header > h1").text
       unknown.description = doc.search("#post-64347 > div > p:nth-child(1) > strong").text.strip
        unknown.url = "http://www.sci-news.com/space/solar-wind-outer-heliosphere-new-horizons-07870.html"


        unknown
   end

   def self.scrape_project

   # doc = Nokogiri::HTML(open('http://www.sci-news.com/news/space//'))

    unknown = self.new
    unknown.name = "My Name is : Jeshua Hicks"
    unknown.description = "I like science and technology which is my inspiration for my project!"
    unknown.url = "http://www.sci-news.com"

    unknown
   end
end