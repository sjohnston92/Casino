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
    die_total = ((@die1 + @die2))
    puts "Die 1:#{@die1} Die 2:#{@die2}"
    
    puts "Your total is: #{die_total}"
  end
  
  def dice_sum
    die_total = ((@die1 + @die2))
  end 
 end


@current_player=Customer.new(100, "bob")
 
#start of the game

def dice_prompt
  puts "Would you like to roll the dice? (y/n)"
  start_answer = gets.chomp
  if start_answer == "y" && @current_player.wallet_balence > 0
    puts "Place your bet. You have #{@current_player.wallet_balence} chips left"
    bet = gets.chomp
    while true
      if (@current_player.wallet_balence.to_i - bet.to_i) < 0
        puts "You dont have that much to bet!"
        bet = gets.chomp
        dice_prompt
      else
        break
      end
    end
    if bet.to_i >= 25
      puts bet.to_s + "! We have a high roller in the house everyone!"
      puts "I'll roll two dice. What do you think the total will be?"
    else
      puts bet.to_s + "! I'll roll two dice. What do you think the total will be?"
    end
    guess_for_total = gets.chomp
    @d=Dice.new
    @d.show_dice
    puts
    if @d.dice_sum.to_i == guess_for_total.to_i
      puts "Winner, WInner Chicken Dinner"
      puts "You won #{bet}"
      @current_player.wallet_balence = @current_player.wallet_balence.to_i + bet.to_i
      puts "Your current balence is: #{@current_player.wallet_balence}"
      dice_prompt
    else
      puts "You lost!"
      puts "You lost #{bet}"
      @current_player.wallet_balence = @current_player.wallet_balence.to_i - bet.to_i
      puts "Your total is #{@current_player.wallet_balence}"
      dice_prompt
    end
    
  else
    puts "Good Bye, enjoy one of our other games!"
    
  end
  

end


dice_prompt










