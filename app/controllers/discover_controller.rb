class DiscoverController < ApplicationController
  def show
    @user = User.find(params[:user_id])
  end

  def search
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["TMBD_API_KEY"] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("/3/search/movie")
    
    json = JSON.parse(response.body, symbolize_names: true)

    movies = json[:movies]
    movies.find_all do |movie|
      movie_name = movie[:name].split(' ')[0].gsub(',', '')
      movie_name == params[:search]
    end

    render "/users/#{:user_id}/movies"
  end
end