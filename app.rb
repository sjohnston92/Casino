require_relative "dice"
require_relative "customer"
require_relative "casino"
require_relative "games"

#This is where will load up the customers, games and prompt
def casino_floor
  game1 = Games.new("Black Jack")
  game2 =Games.new("Craps")

  all_games = [game1, game2]

  casino_floor= Casino.new(all_games)
end

 casino_floor.display_main_menu

