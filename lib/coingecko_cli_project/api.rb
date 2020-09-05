#request method
require "HTTParty"

class CoingeckoCliProject::Api
    
    def fetch_data
        url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
        data = HTTParty.get(url)
        # binding.pry
        #creates a loop list, creating objects
        i = 0
        data.each do |name, symbol, market_cap_rank, current_price, high_24h, low_24h, circulating_supply, ath_change_percentage|
        market_cap_rank = data[i]["market_cap_rank"]
        symbol = data[i]['symbol']
        name = data[i]['name']
        current_price = data[i]['current_price']
        high_24h = data[i]['high_24h']
        low_24h = data[i]['low_24h']
        circulating_supply = data[i]['circulating_supply']
        ath_change_percentage = data[i]['ath_change_percentage']
        i += 1       
        CoingeckoCliProject::Crypto.new(name, symbol, market_cap_rank, current_price, high_24h, low_24h, circulating_supply, ath_change_percentage)
        #creating new instantiate of a object
        end
    end
end


# data[0].keys
# # ["id", "symbol", "name", "image", "current_price", "market_cap", "market_cap_rank", 
# "fully_diluted_valuation", "total_volume", "high_24h", "low_24h", "price_change_24h", 
# "price_change_percentage_24h", "market_cap_change_24h", "market_cap_change_percentage_24h", 
# "circulating_supply", "total_supply", "max_supply", "ath", "ath_change_percentage", "ath_date", 
# "atl", "atl_change_percentage", "atl_date", "roi", "last_updated"] 


# # uri = URI.parse(URL)
# # response = Net::HTTP.get_response(uri)
# # puts response.bodya
# response = http.request(request)
# puts JSON.parse(response.body)