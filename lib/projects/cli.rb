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
    puts 'please type in list to continue or exit to leave'
  end

  def list_sci_articles
    input = gets.chomp
    if input == 'list'
    puts ''
    science = Projects::Science.all
    science.each.with_index(1) {|science, index| puts "#{index}. #{science.name}"}
    list_sci_articles
    end
  end

  def menu
    puts 'enter the number youd like more information on or type list for selection'
    input = gets.chomp

    if input.to_i.positive?
     science_choice = Projects::Science.find_by_index(input.to_i - 1)
     puts ''
    if input == '1'
      puts "#{science_choice.description}"
    else input == '2'
      puts "#{science_choice.description}"
    if input == 'list'
      puts list_sci_articles
    end
    end
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