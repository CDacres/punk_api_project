require 'spec_helper'
require_relative '../punk_object.rb'

describe 'Validate Beer Services & Fields' do

  context 'Single Beer' do
    before(:all) do
      beer_service = BeersService.new
      @beer = beer_service.get_single_beer("1")
    end

    it 'should have an id which is an integer' do
      expect(@beer["id"]).to be_a(Integer)
    end

    it 'should have a name which is a string' do
      expect(@beer["name"]).to be_a(String)
    end

    it 'should have a first_brewed date which is a string' do
      expect(@beer["first_brewed"]).to be_a(String)
    end

    it 'should have a first_brewed date which is 7 characters long' do
      expect(@beer["first_brewed"].length).to eq(7)
    end

    it 'should have a first_brewed date which contains a /' do
      expect(@beer["first_brewed"]).to include('/')
    end

    it 'should have a first_brewed date which is 2 characters followed by a / followed by 4 characters' do
      split_array = @beer["first_brewed"].split('/')
      expect(split_array[0].length).to eq(2)
      expect(split_array[1].length).to eq(4)
    end

    it 'should have an ingredients which is a hash' do
      expect(@beer["ingredients"]).to be_a(Hash)
    end

    it 'abv should be a float or integer or null' do
      expect(@beer["abv"]).to be_a(Float).or be_a(Integer).or be_a(NilClass)
    end

  end

  context 'Random Beer' do
    before(:all) do
      beer_service = BeersService.new
      @beer = beer_service.get_random_beer
    end

    it 'should have an id which is an integer' do
      expect(@beer["id"]).to be_a(Integer)
    end

    it 'should have a name which is a string' do
      expect(@beer["name"]).to be_a(String)
    end

    it 'should have a first_brewed date which is a string' do
      expect(@beer["first_brewed"]).to be_a(String)
    end

    it 'should have a first_brewed date which is 7 characters long' do
      expect(@beer["first_brewed"].length).to eq(7)
    end

    it 'should have a first_brewed date which contains a /' do
      expect(@beer["first_brewed"]).to include('/')
    end

    it 'should have a first_brewed date which is 2 characters followed by a / followed by 4 characters' do
      split_array = @beer["first_brewed"].split('/')
      expect(split_array[0].length).to eq(2)
      expect(split_array[1].length).to eq(4)
    end

    it 'should have an ingredients which is a hash' do
      expect(@beer["ingredients"]).to be_a(Hash)
    end

    it 'abv should be a float or integer or null' do
      expect(@beer["abv"]).to be_a(Float).or be_a(Integer).or be_a(NilClass)
    end

  end

  context 'All Beers' do

    before(:all) do
      beer_service = BeersService.new
      @beer = beer_service.get_all_beers
    end

    it 'should return an array of 80 beers' do
      expect(@beer).to be_a(Array)
      expect(@beer.length).to eq(80)
    end

    it 'each hash in the array should have an id which is an integer' do
      @beer.each do |i|
        expect(i["id"]).to be_a(Integer)
      end
    end

    it 'each hash in the array should have a first_brewed date which is a string of 2 characters followed by a / followed by 4 characters' do
      @beer.each do |i|
        expect(i["first_brewed"]).to be_a(String)
        expect(i["first_brewed"].length).to eq(7)
        expect(i["first_brewed"]).to include('/')
        split_array = i["first_brewed"].split('/')
        expect(split_array[0].length).to eq(2)
        expect(split_array[1].length).to eq(4)
      end
    end

    it 'abv should be a float or integer or null' do
      @beer.each do |i|
        expect(i["abv"]).to be_a(Float).or be_a(Integer).or be_a(NilClass)
      end
    end

  end

  context 'Search Beers' do

    before(:all) do
      beer_service = BeersService.new
      @beer = beer_service.get_beer_search_results({'abv_gt' => '8', 'yeast' => 'American'})
      @beer_function_check = BeersService.new
    end

    it 'check_params_valid method should put keys and values from search params into respective arrays if valid' do
      @beer_function_check.check_params_valid({'ibu_gt' => '50', 'hops' => 'Amarillo'})
      expect(@beer_function_check.key_array).to eq(['ibu_gt','hops'])
      expect(@beer_function_check.value_array).to eq(['50','Amarillo'])
    end

    it 'check_params_valid method should raise an error if not valid' do
      expect{@beer_function_check.check_params_valid({'invalid' => 'test'})}.to raise_error"No valid parameters entered"
    end

    it 'add_params_to_url method should add key and value arrays to url params string in correct url format' do
      @beer_function_check.add_params_to_url
      expect(@beer_function_check.url_params). to eq('?ibu_gt=50&hops=Amarillo')
    end

    it 'should return an array of up to 25 beers' do
      expect(@beer).to be_a(Array)
      expect(@beer.length).to be <= 25
    end

    it 'each hash in the array should have an id which is an integer' do
      @beer.each do |i|
        expect(i["id"]).to be_a(Integer)
      end
    end

    it 'each hash in the array should have a first_brewed date which is a string of 2 characters followed by a / followed by 4 characters' do
      @beer.each do |i|
        expect(i["first_brewed"]).to be_a(String)
        expect(i["first_brewed"].length).to eq(7)
        expect(i["first_brewed"]).to include('/')
        split_array = i["first_brewed"].split('/')
        expect(split_array[0].length).to eq(2)
        expect(split_array[1].length).to eq(4)
      end
    end

    it 'abv should be a float or integer or null' do
      @beer.each do |i|
        expect(i["abv"]).to be_a(Float).or be_a(Integer).or be_a(NilClass)
      end
    end

  end

end
