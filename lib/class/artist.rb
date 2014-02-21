class Artist
  attr_accessor :name, :songs, :genres
  @@all_artists = []

def initialize
  @@all_artists << self
  self.songs = []
  @genres = []
end

def add_song(song)
  self.songs << song
  song.artist = self
  self.genres << song.genre
  song.genre.artists << self if song.genre && !song.genre.artists.include?(self)
end

def add_songs(songs)
  songs.each {|s| add_song(s)}
end

def self.create_by_name(name)
  a = Artist.new
  a.name = name
  a
end

def self.find_by_name(name)
  self.all.each { |artist| artist if artist.name == name }[0]
end

def self.all
  @@all_artists
end

def self.reset_artists
  @@all_artists.clear
end

def self.count
  self.all.count
end

def self.reset_all
  @@all_artists.clear
end

def url
  @name.downcase.gsub(' ','_') << '.html'
end 

end