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
    def craps
      @craps=Dice.new
    end
    def game_choice
      puts"Select which game you would like to play?"
      game_selected = gets.chomp.to_i
      case game_selected
      when 1
        puts "Black Jack"
        require_relative "blackjack"
      when 2
        puts "Craps"
        require_relative "dice"
      when 3
        puts "High and low"
      when 4
        puts "Slots"
      when 0
        puts "Good Bye, Better luck next time."
        exit
      end
    end

  end
end



