require_relative "blackjack"

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
    puts"Select which game you would like to play? to quit press (q)"
      game_selected = gets.chomp.to_i
      case game_selected
      when 1
        puts "Craps"
        load 'dice.rb'
        display_main_menu
        game_choice
      when 2
        puts "Black Jack"
        blackjack_setup
        display_main_menu
        game_choice
      when 3
        puts "High and low"
        display_main_menu
        game_choice
      when 4
        puts "Slots"
        load 'slots.rb'
        display_main_menu
        game_choice

      end
    end

  end
end



