require 'spec_helper'
require_relative '../punk_object.rb'

describe 'Validate beer fields' do

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

  end

  context 'All Beers' do

    before(:all) do
      beer_service = BeersService.new
      @beer = beer_service.get_all_beers
    end

    it 'should return an array of 25 beers' do
      expect(@beer).to be_a(Array)
      expect(@beer.length).to eq(25)
    end

  end

  context 'Search Beers' do

    before(:all) do
      beer_service = BeersService.new
      @beer = beer_service.get_beer_search_results({'abv_gt' => '8', 'yeast' => 'American'})
      @beer_function_check = BeersService.new
    end

    it 'should put keys and values from search params into respective arrays if valid' do
      @beer_function_check.check_params_valid({'abv_gt' => '8', 'yeast' => 'American'})
      expect(@beer_function_check.key_array).to eq(['abv_gt','yeast'])
      expect(@beer_function_check.value_array).to eq(['8','American'])
    end

    it 'should return an array of 25 beers' do
      expect(@beer).to be_a(Array)
      expect(@beer.length).to eq(25)
    end

  end

end
