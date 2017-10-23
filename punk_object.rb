require 'httparty'
require 'json'

class BeersService
  include HTTParty

  base_uri 'https://api.punkapi.com/v2'

  def get_single_beer(beer_id)
    JSON.parse(self.class.get("/beers/#{beer_id}").body)
  end

  def get_random_beer
    JSON.parse(self.class.get("/beers/random").body)
  end


end

beer = BeersService.new
p beer.get_single_beer("1")
