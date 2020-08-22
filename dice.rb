require_relative "customer"


class Dice
  def initialize
    roll
  end
  
  def roll
    @die1 = 1 + rand(6)
    @die2 = 1 + rand(6) 
  end
  
  def show_dice
    print "Die1: ", @die1, " Die2:", @die2
  end
  
  def show_sum
    print "Sum of dice is ", @die1 + @die2, ".\n"
  end 
 end

#  d = Dice.new
#  d.show_dice
#  puts
#  d.show_sum


 
def prompt


  puts "Would you like to roll the dice? (y/n)"
  @current_player=Customer.new(100, "bob")

  start_answer = gets.chomp
  if start_answer == "y" && @current_player.wallet_balence > 0
    puts "Place your bets. You have #{@current_player.wallet_balence} chips left"
    bet = gets.chomp
    while true
      if (@current_player.wallet_balence.to_i - bet.to_i) < 0
        puts 'You dont have that much to bet!'
        bet = gets.chomp
      else
        break
      end
    end
    if bet.to_i > 25
      puts bet.to_s + "! We have a high roller in the house everyone!"
      puts "I'll roll two dice. What do you think the total will be?"
    else
      puts bet.to_s + "! I'll roll two dice. What do you think the total will be?"
    end
    guess_for_total = gets.chomp
    @d=Dice.new
    @d = Dice.new
    @d.show_dice
    puts
    @d.show_sum
    
  
    
  else
    puts "Good Bye, enjoy one of our other games!"
    
  end
  #put customer wallet balance here

end


prompt










