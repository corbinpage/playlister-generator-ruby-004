class Song
  attr_accessor  :name, :artist
  attr_reader    :genre
  @@all_songs = []

def initialize
  @@all_songs << self
  
end

def genre=(g)
  @genre = g
  @genre.songs.push(self)
end

def self.find_by_name(name)
  self.all.select { |song| song if song.name == name }[0]
end

def self.create_by_name(name)
  s = Song.new
  s.name = name
  s
end

def self.all
  @@all_songs
end

def to_s
  "#{@artist.name} - #{name} [#{@genre.name}]"
end

def self.count
  @@all_songs.count
end


def self.reset_all
  @@all_songs.clear

end

def url
  @name.downcase.gsub(' ','_') << '.html'
end 

end