require 'httparty'
require 'json'

class BeersService
  include HTTParty

  attr_accessor :key_array, :value_array, :url_params

  def initialize
    @key_array = []
    @value_array = []
    @url_params = ""
  end

  SEARCH_PARAMS = %w(abv_gt abv_lt ibu_gt ibu_lt ebc_gt ebc_lt beer_name yeast brewed_before brewed_after hops malt food ids)

  base_uri 'https://api.punkapi.com/v2'

  def get_single_beer(beer_id)
    response = JSON.parse(self.class.get("/beers/#{beer_id}").body)
    response[0]
  end

  def get_random_beer
    response = JSON.parse(self.class.get("/beers/random").body)
    response[0]
  end

  def get_all_beers
    response = JSON.parse(self.class.get("/beers?per_page=80").body)
  end

  def check_params_valid(params_hash)
    params_hash.each do |key, value|
      if SEARCH_PARAMS.include?(key)
        @key_array << key
        @value_array << value
      else
        raise "No valid parameters entered"
      end
    end
  end

  def add_params_to_url
    if (@key_array.length > 0 && @value_array.length > 0)
      if (@key_array.length == 1 && @value_array.length == 1)
        @url_params << "?#{@key_array[0]}=#{@value_array[0]}"
      else
        @url_params << "?#{@key_array[0]}=#{@value_array[0]}"
        for i in 1..(@key_array.length)-1 do
          @url_params << "&#{@key_array[i]}=#{@value_array[i]}"
        end
      end
    end
  end

  def get_beer_search_results(query_params)
    self.check_params_valid(query_params)
    self.add_params_to_url
    JSON.parse(self.class.get("/beers#{@url_params}").body)
  end

end
