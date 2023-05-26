require 'rails_helper'

RSpec.describe '/search#index', type: :feature do
  describe 'When a user selects a nation and clicks search' do
    before(:each) do
      visit root_path
      select "Fire Nation", from: :nation
      click_button('Search For Members')
    end
    
    it 'I see the total number of people who live in the nation' do
      
    end

    it 'I see a list with the detailed information for the first 25 member of the nation' do

    end

    it 'for each member I see the name and/or photo, list of allies, list of enemies affiliation' do

    end
  end
end