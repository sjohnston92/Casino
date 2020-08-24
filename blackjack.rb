############ Black Jack ############
# by Jon Roberts

require_relative "deck"
require_relative "card"
@player_bank = 1000 #need to change this to pull via game menu

def blackjack_start

#Create new Deck
@d = Deck.new

 #Shuffling Cards
 @d = @d.shuffle_cards

 #setting value
 card_value_set(@d)

 place_bet

 #setting up, or clearing the hand
@player_hand = []
@dealer_hand = []
@player_a = 0
@dealer_a = 0
#start dealling
start_deal

system "clear"
#show card TODO: hide dealer's first card
# puts "player hands:"
# show_card(@player_hand)
# puts
# puts "dealer hands"
# show_card(@dealer_hand)



player_turn
dealer_turn
endgame

end

def place_bet
    ###TODO: Add Bet here
puts "Please place your bet (Available Balance: $#{@player_bank})"
@player_bet = gets.chomp.to_i
if @player_bet > @player_bank
    puts "Insuffient Funds"
    place_bet
elsif @player_bet < 5
    puts "Minimum Bet is $5"
    place_bet
else
    puts "Betting for $#{@player_bet}! Let's go!"
    @player_bank -= @player_bet
end



end

def player_turn
# sum the player's card. if 21, black jack, pay 2.5 
@player_score = 0

#show player's card. need to show dealer's one card.
@player_hand.each do |x|
    @player_score += x.value 
    i=0
    while i < @player_a
        if @player_score > 21
            @player_score -= 10
            i += 1
        else 
            break
        end
    end
end
system "clear"
puts "Your bet: $#{@player_bet}      Good Luck!"
puts "Your cards:"
show_card(@player_hand)
puts "Total Value of your card: #{@player_score}"
puts
puts "Dealer's Cards"
puts "[   -?-   ] [#{@dealer_hand[1].rank} #{@dealer_hand[1].suit}]"


if @player_score == 21 #need to add count of card, if 2, go this, else, ignore this
    puts "BLACKJACK!"
    @player_bet = (@player_bet * 3)
    puts "You have won $#{@player_bet}"
    @player_bank += @player_bet
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
    system "clear"
    puts "Your bet: $#{@player_bet}      Good Luck!"
    puts "Your cards:"
    show_card(@player_hand)
    puts "Total Value of your card: #{@player_score}"
    puts 
    puts "Dealer's Cards"
    # reveal Dealer's cards
    show_card (@dealer_hand)
    @dealer_score = 0
    @dealer_hand.each do |x|
        @dealer_score += x.value
        i=0
        while i < @dealer_a
            if @dealer_score > 21
                @dealer_score -= 10
                i += 1
            else 
                break
            end
        end
    end
    puts "Total Value of Dealer's Card: #{@dealer_score}"

    
# if Stand, Dealer's total is less than 16, hit for dealer
    case @dealer_score 
    when 0..16 then
        puts "Dealer deal another card"
        deal(@dealer_hand)
        dealer_turn
    when 17..21 then
        puts "Dealer will not deal more card."
        compare_card
    when 22..30 then
        @player_bet = @player_bet * 2
        puts "Dealer busted! you win $#{@player_bet}!"
        @player_bank += @player_bet
        #Add player winning bet
        endgame
        exit
    end

# if over 17, beat other card, Lose
# if over 17, player card beat, win
end

def compare_card
    if @player_score > @dealer_score
        @player_bet = @player_bet * 2
        puts "You win $#{@player_bet}!"
        @player_bank += @player_bet
    elsif @player_score < @dealer_score
        puts "You lose! :("
    elsif @player_score == @dealer_score
        puts "It is a tie. Nice try!" 
        @player_bank += @player_bet
    end

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
    if @d[0].rank == "A"
        x << @d.shift
        if x == @player_hand
            @player_a =+ 1
        elsif x == @dealer_hand
            @dealer_a =+ 1
        end
    else
        x << @d.shift
    end
end

def show_card(x)
    x.each do |cards|
        print "[#{cards.rank} #{cards.suit}]"
    end
    puts 
end

def endgame
puts "Would you like to play again? (y/n)"
user_selection = gets.chomp
case user_selection
when 'y'
    blackjack_start
when 'n'
    exit
else 
    puts "try again"
end
    #Play again? if yes, go to blackjack_start

puts "End Game Options here to redo game or quit"

#if not, return the following information back: Win/Lose Stats, Money Won.

end

blackjack_start