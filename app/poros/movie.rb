class Movie
  attr_reader :name, :party, :id

  def initialize(attributes)
    @name = attributes[:name]
    @party = attributes[:partyName]
    @movie = attributes[:id] # movie_id
  end
end