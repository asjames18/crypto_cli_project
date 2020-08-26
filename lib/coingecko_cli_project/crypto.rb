class CoingeckoCliProject::Crypto
    
    attr_accessor :market_cap_rank, :symbol, :name, :current_price, :high_24h, :low_24h, :circulating_supply, :ath_change_percentage
    	
    @@all = []

    def initialize(name, symbol, market_cap_rank, current_price, high_24h, low_24h, circulating_supply, ath_change_percentage)
        @market_cap_rank = market_cap_rank
        @symbol = symbol
        @name = name
        @current_price = current_price
        @high_24h = high_24h
        @low_24h = low_24h
        @circulating_supply = circulating_supply
        @ath_change_percentage = ath_change_percentage 
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end
  
