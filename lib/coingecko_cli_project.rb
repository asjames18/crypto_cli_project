
require_relative "./coingecko_cli_project/version"
require_relative "./coingecko_cli_project/cli"
require_relative "./coingecko_cli_project/api"
require_relative "./coingecko_cli_project/crypto"

require 'pry'
require 'httparty'
require 'open-uri'
require 'json'
require 'colorize'

# require 'rest-client'
# require 'unirest'


module CoingeckoCliProject
  class Error < StandardError; end
end

