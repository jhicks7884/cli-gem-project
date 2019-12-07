class Projects::Scraper

  def self.scrape

      doc = Nokogiri::HTML(open("http://www.sci-news.com"))

      name = doc.search("#main > div > div.box.block1 > div > div.block > div > article > h3 > a").text
      description = doc.search("#main > div > div.box.block1 > div > div.block > div > article > div").text.strip
      url = "click on link to read more "  "http://www.sci-news.com/astronomy/milky-ways-thick-disk-07881.html "

      Projects::Science.new(name, description, url)
  

  
    doc = Nokogiri::HTML(open('http://www.sci-news.com/space/solar-wind-outer-heliosphere-new-horizons-07870.html'))

    name =  doc.search("#content > header > h1").text
    description = doc.search("#post-64347 > div > p:nth-child(1)").text.strip
    url = "http://www.sci-news.com/space/solar-wind-outer-heliosphere-new-horizons-07870.html"

    Projects::Science.new(name, description, url)
  end
end
