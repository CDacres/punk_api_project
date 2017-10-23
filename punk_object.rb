require 'httparty'
require 'json'

class BeersService
  include HTTParty

  SEARCH_PARAMS = %w(abv_gt abv_lt ibu_gt ibu_lt ebc_gt ebc_lt beer_name yeast brewed_before brewed_after hops malt food ids)

  base_uri 'https://api.punkapi.com/v2'

  def get_single_beer(beer_id)
    JSON.parse(self.class.get("/beers/#{beer_id}").body)
  end

  def get_random_beer
    JSON.parse(self.class.get("/beers/random").body)
  end

  def check_params_valid(params_hash)
    params_hash.each do |key, value|
      if SEARCH_PARAMS.include?(key)
        p value
      else
        raise "No valid parameters entered"
      end
    end
  end

end

beer = BeersService.new
# p beer.get_single_beer("1")
beer.check_params_valid({'abv_gt' => 5})
