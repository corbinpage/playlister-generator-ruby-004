class Genre
  attr_accessor :name, :songs, :artists
  @@all_genres = []

def initialize
  @songs = []
  @artists = []
  @@all_genres << self
end

def self.count
  self.all.count
end

def self.all
  @@all_genres
end

def self.reset_genres
  @@all_genres.clear
end

def self.reset_all
  @@all_genres.clear
end

def self.find_by_name(name)
  self.all.select { |genre| genre if genre.name == name }[0]
end

def self.create_by_name(name)
  g = Genre.new
  g.name = name
  g
end

def url
  @name.downcase.gsub(' ','_') << '.html'
end 

end