#******** Dice Game by Simon Johnston ################


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

 def craps_roll

 end


@current_player=Customer.new(100, "bob")
 
#start of the game

def dice_prompt
  puts "Would you like to Play Craps and roll the dice? (y/n)"
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
    case @d.dice_sum
    when 7 || 11
      if guess_for_total.to_i == @d.dice_sum.to_i
      puts "Winner Winner Chicken Dinner"
      puts "You won #{bet.to_1*2}"
      @current_player.wallet_balence = @current_player.wallet_balence.to_i + bet.to_i*2
      puts "Your current balence is: #{@current_player.wallet_balence}"
      dice_prompt
      else
        puts "You still won even though you didnt guess the right number"
        puts "You won #{bet.to_i}"
        @current_player.wallet_balence = @current_player.wallet_balence.to_i + bet.to_i
        puts "Your current balence is: #{@current_player.wallet_balence}"
        dice_prompt
      end
    when 2
      puts "Snake Eyes, You Lost big time"
      puts "You lost #{bet*2}"
      @current_player.wallet_balence = @current_player.wallet_balence.to_i - bet.to_i*2
      puts "Your balance is #{@current_player.wallet_balence}"
      dice_prompt
    when 12 || 3
      puts "Sorry about that"
      puts "You lost #{bet}"
      @current_player.wallet_balence = @current_player.wallet_balence.to_i - bet.to_i
      puts "Your balance is #{@current_player.wallet_balence}"
      dice_prompt
    else 4 || 5 || 6 || 8 || 9 || 10
      if guess_for_total.to_i == @d.dice_sum.to_i
      puts "Well since you guessed the right number you win some money."
      @current_player.wallet_balence = @current_player.wallet_balence.to_i + bet.to_i/2
      else
      puts "Well you dont win or loose and you also didnt guess the right number"
      puts "Your balance is #{@current_player.wallet_balence}"
      dice_prompt
      end
      
    end

    
  else
    puts "Good Bye, enjoy one of our other games!"
    
  end
  

end


dice_prompt


# dice_prompt










