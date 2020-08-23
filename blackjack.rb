############ Black Jack ############
# by Jon Roberts

require_relative "deck"
require_relative "card"
@player_hand = []
@dealer_hand = []
@player_bank = 1000

def blackjack_start

 #need to change this to pull via game menu

#Create new Deck
@d = Deck.new

 #Shuffling Cards
 @d = @d.shuffle_cards

 #setting value
 card_value_set(@d)

#start dealling
start_deal

system "clear"
#show card TODO: hide dealer's first card
puts "player hands:"
show_card(@player_hand)
puts
puts "dealer hands"
show_card(@dealer_hand)

place_bet

player_turn
dealer_turn
endgame

end

def place_bet
    ###TODO: Add Bet here
puts "add bets"
@player_bet = gets.chomp 
end

def player_turn
# sum the player's card. if 21, black jack, pay 2.5 
# sum the dealer card
@player_score = 0

@player_hand.each do |x|
    @player_score += x.value 
end
system "clear"
puts "Your cards:"
show_card(@player_hand)
puts "Total Value of your card: #{@player_score}"

if @player_score == 21 #need to add count of card, if 2, go this, else, ignore this
    puts "BLACKJACK!"
    endgame #win bet
    exit

elsif @player_score > 21
    puts "BUSTED!"
    endgame #lost bet
    exit
end

puts "Would you like to [1] Hit or [2] Stand?"
player_selection = gets.chomp.to_i

case player_selection
when 1 then deal(@player_hand)
    puts "Giving you another card"
    player_turn
when 2 then
    dealer_turn
end

# Ask player Hit, Stand
# Player hit, if over 21, but have A, take 10 out of the total score
# if over 21, automatically lose


end

def dealer_turn
    @dealer_score = 0

# reveal Dealer's first card
# if Stand, Dealer's total is less than 16, hit for dealer

# if over 17, beat other card, Lose
# if over 17, player card beat, win


end

def card_value_set(x)
    #Assigning cards value
   x.each do |cards|
       if cards.rank == "J" || cards.rank == "Q" || cards.rank == "K"
           cards.value = 10
       elsif cards.rank == ( "A" )
           cards.value = 11
       else
           cards.value = cards.rank.to_i
       end
       end
end


def start_deal
    #Deal cards to player and dealer TODO: refactor this into loop
    deal(@player_hand)
    deal(@dealer_hand)
    deal(@player_hand)
    deal(@dealer_hand)
end

# Dealing a card (taking card out of "d"eck and put into x (hand))
def deal(x)
    x << @d.shift
end

def show_card(x)
    x.each do |cards|
        print "[#{cards.rank} #{cards.suit}]"
    end
    puts 
end

def endgame
#Play again? if yes, go to blackjack_start

puts "End Game Options here to redo game or quit"

#if not, return the following information back: Win/Lose Stats, Money Won.

end

blackjack_start