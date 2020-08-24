
require_relative "customer"
require_relative "casino"
require_relative "games"

#This is where will load up the customers, games and prompt
def casino_floor
  game1 =Games.new("Craps")
  game2 =Games.new("Black Jack")
  game3 =Games.new("High and Low")
  game4 =Games.new("Slots")

  all_games = [game1, game2, game3, game4]

  @current_player=Customer.new(1000, "bob")
  casino_floor= Casino.new(all_games)

  
end


#Start of the  app running all games and displays.


 casino_floor.display_main_menu
 casino_floor.game_choice








 

