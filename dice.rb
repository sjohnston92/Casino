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

def dice_game
  d = Dice.new
  d.show_dice
  puts
  d.show_sum
  end

def dice_prompt
  puts "Would you like to play? (y/n)"
  craps_answer=gets.chomp
  if craps_answer == "y"
    dice_game
  
  else craps_answer != "y"
    puts "Try one of other great Games"
  end

end




#Start of the Game
puts "Welcome to the games of Craps"
dice_prompt

