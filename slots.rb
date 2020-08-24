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
#
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

