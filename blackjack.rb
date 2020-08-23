############ Black Jack ############
# by Jon Roberts

require_relative "deck"
require_relative "card"
@player_hand = []
@dealer_hand = []

def blackjack_start

#Create new Deck
@d = Deck.new

 #Shuffling Cards
 @d = @d.shuffle_cards

 #setting value
 card_value_set(@d)
p @d    

start_deal

puts "player hands:"
show_card(@player_hand)
puts
puts "dealer hands"
show_card(@dealer_hand)
end

def card_value_set(x)
    #Assigning cards value
   x.each do |cards|
       p cards
       p cards.rank
       if cards.rank == "J" || cards.rank == "Q" || cards.rank == "K"
           cards.value = 10
       elsif cards.rank == ( "A" )
           cards.value = 11
       else
           cards.value = cards.rank.to_i
       end
       p cards
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