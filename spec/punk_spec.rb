require 'spec_helper'
require_relative '../punk_object.rb'

describe 'Validate beer fields' do

  context 'Single Beer' do
    before(:all) do
      beer_service = BeersService.new
      @beer = beer_service.get_single_beer("1")
    end

    it '' do
    end

  end

end
