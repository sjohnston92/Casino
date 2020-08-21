############ Black Jack ############
# by Jon Roberts

require_relative "deck"
require_relative "card"

def blackjack_start
@d = Deck.new
@d = @d.shuffle_cards
test1
end

#assigning value to each cards (easier to do add for these that have suits)

def test1
    p @d.class #just to remind what class this is
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