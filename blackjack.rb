############ Black Jack ############
# by Jon Roberts

require_relative "deck"
require_relative "card"
@player_hand = []
@dealer_hand = []

def blackjack_start
@d = Deck.new
p @d.class
#assigning value to each cards (easier to do add for these that have suits).
#need to do prior to shuffle cards as it will change it into array

@d = @d.shuffle_cards

start_deal

puts "player hands:"
print @player_hand
puts
puts "dealer hands"
print @dealer_hand
end

def start_deal
    #Deal cards to player and dealer
    deal(@player_hand)
    deal(@dealer_hand)
    deal(@player_hand)
    deal(@dealer_hand)
end

# Dealing a card (taking card out of "d"eck and put into x (hand))
def deal(x)
    x << @d.shift
end
# dealer deal a card to player
# dealer deal a card to dealer (may need to make it hidden)

# dealer deal a card to player
# dealer deal a card to dealer (may need to make it visible)

# sum the player's card. if 21, black jack, pay 2.5 
# sum the dealer card

# Ask player Hit, Stand
# Player hit, if over 21, but have A, take 10 out of the total score
# if over 21, automatically lose

# reveal Dealer's first card
# if Stand, Dealer's total is less than 16, hit for dealer

# if over 17, beat other card, Lose
# if over 17, player card beat, win

#Play again? if yes, go to blackjack_start

blackjack_start