require 'rails_helper'

RSpec.describe '/welcom#index', type: :feature do
  describe 'when a user visits the root path' do
    it 'I see a drop down with the different nations' do
      visit root_path

      expect(page).to have_content('The Four Nations')
      expect(page).to have_content('Search For Members by their Nation')
      expect(page).to have_selector(class: 'select-field')
      expect(page).to have_button('Search For Members')

      select "Fire Nation", from: :nation
      
      click_button('Search For Members')

      expect(current_path).to be(search_path)
    end
  end
end