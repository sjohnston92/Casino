class Casino
  attr_accessor :casinogames 

  def initialize(all_games)
    @all_games = all_games

    def display_main_menu
      puts "Welcome to Casino Dev"
      puts "-"*20
      @all_games.each_with_index do |games, index|
        puts "#{index + 1}) #{games}"
      end
    end
    def craps
      @craps=Dice.new
    end
    def game_choice
    puts"Select which game you would like to play? to quit press (q)"
      game_selected = gets.chomp.to_i
      case game_selected
      when 1
        puts "Craps"
        require_relative "dice"
        display_main_menu
        game_choice
      when 2
        puts "Black Jack"
        require_relative "blackjack"
        display_main_menu
        game_choice
      when 3
        puts "High and low"
        #Victor put your game here
        display_main_menu
        game_choice
      when 4
        puts "Slots"
        class Slots
          Reels = 3
          Symbols = %w[Shark Pikachu Apple Fire Rock Lizard]
          Keep_Playing_Responses = %w[y yes yeah]
        
          def initialize(wallet=nil)
            unless wallet
              begin
                print "How much total money would you like to play with today? "
                wallet = gets.to_i
                puts "You need money in your wallet to play!" if wallet<=0
              end until wallet > 0
            end
            @wallet = wallet
          end
        
          def play_forever
            begin
              play_one_turn
            end while @wallet>0 && keep_playing?
            puts "You have $#{@wallet} left in your wallet. Thanks for playing!"
          end
        
          def play_one_turn
            puts "Total credits: $#{@wallet}"
        
            begin
              print "Enter the amount you would like to bet. "
              bet = gets.to_i
              puts "Your wallet contains $#{@wallet}." if bet > @wallet
            end until bet <= @wallet
            @wallet -= bet
        
            results = Reels.times.map{ Symbols.sample }
            puts results.join(' - ')
            winnings = bet * multiplier(results)
        
            if winnings>0
              @wallet += winnings
              puts "You just won $#{winnings}. Congratulations!"
            else
              puts "Take the L."
            end
          end
        
          def keep_playing?
            print "Would you like to continue? (yes/no) "
            Keep_Playing_Responses.include?(gets.chomp.downcase)
          end
        
          private 
            def multiplier(*symbols)
              case symbols.flatten.uniq.length
                when 1 then 3
                when 2 then 2
                else 0
              end
            end
        end
        
        Slots.new.play_forever 
        
        display_main_menu
        game_choice
      when 0
        puts "Good Bye, Better luck next time."
        exit
      end
    end

  end
end



