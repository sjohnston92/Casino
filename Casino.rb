class Casino
  attr_accessor :casinogames 

  def initialize(all_games)
    @all_games = all_games

    def display_main_menu
      puts "Welcome to Casino Dev"
      puts "-"*20
      @all_games.each_with_index do |games, index|
        puts "#{index + 1}) #{games}"
      end
    end
    
  end

  end