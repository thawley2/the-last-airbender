require 'rails_helper'

RSpec.describe '/search#index', type: :feature do
  describe 'When a user selects a nation and clicks search' do
    before(:each) do
      def find_nation_members(nation)
        get_url("/api/v1/characters?affiliation=#{nation}&perPage=200")
      end
    
      def conn 
        Faraday.new(url: 'https://last-airbender-api.fly.dev')
      end
    
      def get_url(url)
        response = conn.get(url)
        JSON.parse(response.body, symbolize_names: true)
      end
      visit root_path
      select "Fire Nation", from: :nation
      click_button('Search For Members')
    end

    it 'I see the total number of people who live in the nation' do
      nation_members = find_nation_members('fire+nation')

      expect(page).to have_content('Fire nation')
      expect(page).to have_content("Number of Members: #{nation_members.count}")
    end

    it 'I see a list with the detailed information for the first 25 member of the nation' do
      nation_members = find_nation_members('fire+nation')

      expect(page).to have_content('First 25 Members:')
      within ("#member_#{nation_members.first[:_id]}") do
        expect(page).to have_content("Name: #{nation_members.first[:name]}")
        expect(page).to have_content("Allies: #{nation_members.first[:allies].to_sentence}")
        expect(page).to have_content("Enemies: #{nation_members.first[:enemies].to_sentence}")
        expect(page).to have_content("Affiliation: #{nation_members.first[:affiliation]}")
      end

    end

    xit 'for each member I see the photo if present' do
      nation_members = find_nation_members('fire+nation') 
      # require 'pry'; binding.pry
      within ("#member_#{nation_members[1][:_id]}") do
        expect(page).to have_css("img[src*=#{nation_members[1][:photoUrl]}]")
      end

      within third('#member') do

      end
    end
  end
end