#Controller
class CoingeckoCliProject::Cli

    def call
        CoingeckoCliProject::Api.new.fetch_data
        greeting  
    end

    def greeting


        puts <<-DOC

                 Welcome to Blockchain Coins!
💵​💶​💷​💴​🪙​​💵​💶​💷​💴​🪙​​💵​💶​💷​💴​🪙​ 💵​💶​💷​💴​🪙​​💵​💶​💷​💴​🪙​​💵​💶​💷​💴​🪙​​ 💷​💴​​💷​💴​🪙​1
------------------------------------------------------------------
    Type "list" to see coins or type "exit" to exit the program:.
------------------------------------------------------------------
DOC
puts ""
menu
puts""
    end

    def menu
        input = gets.strip.downcase
        if input == "list"
            coin_list
        elsif input == "exit"
            exit
        else
            invalid_entry 
        end
    end
    def invalid_entry
        puts "⛔error: incorrect entry⛔".red.bold
        puts "-------------------------"
        puts "Type: LIST to see coins or exit".yellow.bold
        menu
    end

    def coin_list
        CoingeckoCliProject::Crypto.all.each_with_index do |crypto, index|
            # binding.pry
        puts "#{index + 1}." "#{crypto.name}"
        end
        select_coin
    end

    def select_coin
        puts ""
        puts ""
        puts "Pick a coin from the list for more information or EXIT.".yellow.bold
        input = gets.strip.downcase
        if input.to_i > 0 && input.to_i <= CoingeckoCliProject::Crypto.all.size  
        coin_info(input)
        elsif input == "list"
            coin_list
        elsif input == "exit"
            exit
        elsif
            invalid_entry 
        end
    end

    def exit
        puts "Goodbye".yellow.bold
    end
end

def coin_info(input)
        coingecko = CoingeckoCliProject::Crypto.all[input.to_i-1]
        puts "------------------------------------------------------------------"
        puts "name: #{coingecko.name}"
        puts "symbol: #{coingecko.symbol}"
        puts "market_cap_rank: #{coingecko.market_cap_rank}"
        puts "current_price: #{coingecko.current_price}"
        puts "high_24h: #{coingecko.high_24h}"
        puts "low_24h: #{coingecko.low_24h}"
        puts "circulating_supply: #{coingecko.circulating_supply}"
        puts "ath_change_percentage: #{coingecko.ath_change_percentage}"
        puts "------------------------------------------------------------------"
        puts ""
        puts "Pick another coin or type LIST to see all coins".yellow.bold
        puts " or EXIT".yellow.bold
        input = gets.strip.downcase
        if input.to_i > 0 && input.to_i <= CoingeckoCliProject::Crypto.all.size  
        coin_info(input)
        elsif input == "list"
            coin_list
        elsif input == "exit"
            exit
        elsif
            invalid_entry 
        else
         menu
        end
end


