require_relative 'artist.rb'
require_relative 'song.rb'
require_relative 'genre.rb'
require 'pry'

class LibraryParser
  attr_accessor :path


def initialize(path)
  @path = path
end

def files
  Dir["#{@path}/*"].collect {|x| x.gsub("#{@path}/",'')}
end

def parse
  files.each do |x|
    parts = parse_filename(x)
    # duplicate = Artist.all.any? {|a| a.name.match(parts[0])}
    # if duplicate
    #   a = Artist.find_by_name(parts[0])
    #   s = Song.create_by_name(parts[1])
    #   g = Genre.find_by_name(parts[2])      
    # else
    #   a = Artist.create_by_name(parts[0])

      if Artist.all.any?{|a| a.name == parts[0]}
        a = Artist.find_by_name(parts[0])
      else
        a = Artist.create_by_name(parts[0]) 
      end
      #binding.pry
      s = Song.create_by_name(parts[1])
      if Genre.all.any?{|g| g.name == parts[2]}
        g = Genre.find_by_name(parts[2])
      else
        g = Genre.create_by_name(parts[2]) 
      end
    
    s.genre = g 
    a.add_song(s)
    #binding.pry
  end

 # binding.pry

end

def parse_filename(filename)
  artist = filename.split(" - ")[0]
  song = filename.split(" - ")[1].split(" [")[0]
  genre = filename.split("[")[1].split("]")[0]

  #puts [artist,song,genre].join(',')

  [artist,song,genre]
end

# def build_song(artist,name,genre)
#   #"#{artist} - #{name} [#{genre}]"

#   a = Artist.create_by_name(artist)
#   s = Song.create_by_name(name) 
#   g = Genre.create_by_name(genre)
#   s.genre = g
#   a.add_song(s)
#   s
# end

end
