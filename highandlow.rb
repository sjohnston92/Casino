
require_relative "deck"
require_relative "card"

class Highandlow 
    @dealers_hand = []
    
    def initialize
       @cards = Deck.new
       @cards.shuffle_cards
    end
    #placing two cards on desk only showing one 
    def cards
        puts "*** High and Low ***"
        puts "Welcome Would you like to play a game (y/n)"
        star_game=gets.chomp 
        if star_game == 'y'
            puts @cards.generate_deck
            puts "Shuffling cards..."
            puts "Place a bet is the cards 'higher' or 'lowwer'"
            bet = gets.chomp
            case bet
            when 'higher'
                higher
            when 'lowwer'
                puts "lowwer"
            when 'Hold'
            else
                puts "invalid bet"
            end
        else
            puts "Thank you for playing"
            
        end
    end
    def higher
        puts @cards.display_cards
    end
end

vic = Highandlow.new
vic.cards
