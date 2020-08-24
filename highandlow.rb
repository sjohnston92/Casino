require_relative "deck"
require_relative "card"

class Highandlow 
    def initialize
       @cards = Deck.new
       @cards.shuffle_cards
    end
    #placing two cards on desk only showing one 
    def cards
        puts "*** High and Low ***"
        puts "Welcome to the game"
        puts @cards.generate_deck
        puts "Shuffling cards..."
        
    end
#     #players place bet in a pull 
#     def players

#     end     
#     #second card gets reveal (while showing first one)
#     #if right you win points(money)
#     #else you lose your bet collect
#      def winning_casses

#     end
end 

 
vic = Highandlow.new
def display
vic.cards
end
#random_cards = @cards[rand(@cards.length)]




