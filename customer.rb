class Customer
  attr_accessor :wallet_balence, :name
  
    def initialize(wallet_balence,name)
      @wallet_balence = wallet_balence
      @name = name
    end
    
  end