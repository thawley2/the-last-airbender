class SearchController < ApplicationController
  def index
    @nation_members = find_nation_members(params[:nation])
    @nation = params[:nation]
  end

  private

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
end