# encoding: utf-8
require 'spec_helper'

#
# ToDO: написать более детальные спеки
#
#
describe BrigadesHelper do
  context 'countries_for_select' do
    it 'should return Array' do
      expect(helper.countries_for_select).to be_a_kind_of(Array)
    end

    it 'should return list of all countries' do
      expect(helper.countries_for_select.size).to eq(Country.count)
    end
  end

  context 'brigade_country' do
    before(:all) do
      @test_country = FactoryGirl.create(:country, name: 'зимбабве')
      @test_brigade = FactoryGirl.create(:brigade, country: @test_country)
    end

    it 'should return the country name for the brigade' do
      expect(helper.brigade_country @test_brigade).to eq('Зимбабве')
    end
  end
end
