class Projects::Scraper
  def self.scrape
    doc = Nokogiri::HTML(open('http://www.sci-news.com'))
    node = doc.search('#main > div > div.box > div > div.block > div > article')
    node.each do |article|
     name = article.search('h3 > a').text
     description = article.search('div').text.gsub('read more...', '').strip
     url = article.search('div.block > div > article > div > div')
     Projects::Science.new(name, description, url)
    end
  end
  def self.scrape_unknown
    name = 'Jeshua Hicks'
    description = ' A little about me im 35yrs old, im a father of two girls, Worked on computers for a long time ever since i was a teenager,
    worked in construction until i gt laid off due to health issues, now Learning how to be a programmer is part of a
    field id dream of when i was a kid I enjoy computers, Rc stuff and anything else thats fun...including coding which i find to be amazing..'
    url = 'hello'
    Projects::Science.new(name, description, url)
  end
end