require 'rails_helper'

RSpec.describe Country, type: :model do
  it "should find languages" do
    switzerland = Country.where(code: 'CHE').first

    languages = switzerland.languages.pluck(:language)

    ["German", "French", "Italian", "Romansh"].each do |language|
      expect(languages).to include(language)
    end
  end


  it "should be able to find countries with no cities" do
    countries = [] # your code here
    countries = Country.all
    countries = countries.select { |country| country.cities.first == nil }

    # countries.select do |city|
    #   countries.cities.delete(city)
    # end

    # Hint: Country.all will return an array of all countries
    # Hint: you can use filter to narrow an array
    expect(countries.length).to eq(7)
  end

  it "should be able to sort countries by surfacearea" do
    countries = Country.all
    sorted_by_surfacearea = countries.sort_by do |country|
      -country.surfacearea
      #Hint:  when using sort_by put a '-' in front of your return to reverse the results
    end
    
    expect(sorted_by_surfacearea.first.code).to eq("RUS")
  end

  it "stretch: should find languages spoken in the 2 countries with highest life expectancy" do
    #Hint: filter out countries with lifeexpectancy greater than 0
    #Hint: you'll want to sort lifeexpectancy in descending order
    countries = Country
    .where('lifeexpectancy > 0')
    .limit(2)
    .order('lifeexpectancy DESC')

    expected_languages = countries
    .pluck(:language) 
    expected_languages.each do |language|
      expect(languages).to include(language)
    end
  end
end
