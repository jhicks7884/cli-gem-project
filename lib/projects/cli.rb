class Projects::CLI
  def call
    Projects::Scraper.scrape
    Projects::Scraper.scrape_unknown
    welcome
    list_sci_articles
    menu
  end

  def welcome
    puts 'Welcome To World of Science'
    puts ''
    puts 'whats your Name'
    name = gets.chomp
    puts "Hello Welcome To the World of Science #{name}"
    puts ''
  end

  def list_sci_articles
    puts ''
    science = Projects::Science.all
    science.each.with_index(1) {|science, index| puts "#{index}. #{science.name}"}
  end

  def menu
    puts 'enter the number youd like more information on or type list for selection'
    input = gets.chomp

    if input.to_i.positive? && input.to_i <= Projects::Science.all.count  # takes user input to integer to make sure its a positive  and checks if input is less than 12...
      science_choice = Projects::Science.find_by_index(input.to_i - 1)
      puts ''
      puts "#{science_choice.description}, #{science_choice.url}"
      menu
    elsif input == 'list'
     list_sci_articles

      menu
    elsif input == 'exit'
      system 'clear' or system 'cls'
      exit
    else
      puts 'please try again or type list to Make A Different Selection'
      list_sci_articles
      menu
    end
  end
end