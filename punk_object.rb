require 'httparty'
require 'json'

class BeersService
  include HTTParty

  base_uri 'https://api.punkapi.com/v2'

  def get_single_beer(beer_num)
    JSON.parse(self.class.get("/beers/#{beer_num}").body)
  end

  def get_random_beer
  end

end
