require_relative "deck"
require_relative "card"

class Highandlow 
    def initialize
       @cards = Deck.new
       @cards.shuffle_cards
    end
    #placing two cards on desk only showing one 
    def displaying_card
        puts "*** High and Low ***"
        puts "welcome to the game"
        puts "Shuffeling cards..."
          @cards
    end
    #players place bet in a pull 
    def players

    end     
    #second card gets reveal (while showing first one)
    #if right you win point(money)
    #else you lose your bet 
    def winning_casses

    end
end 
 
vic = Highandlow.new
vic.displaying_card





