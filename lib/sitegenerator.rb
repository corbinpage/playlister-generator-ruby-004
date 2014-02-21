class SiteGenerator

  def make_artists_homepage!
     erb = ERB.new(File.open("lib/views/artist_home.html.erb").read)

      output_file = File.open("./_site/artist_home.html", "w")
      output_file.write(erb.result(binding))
      output_file.close
  end

  def make_genres_homepage!
    erb = ERB.new(File.open("lib/views/genre_home.html.erb").read)

      output_file = File.open("./_site/genre_home.html", "w")
      output_file.write(erb.result(binding))
      output_file.close
  end

  def generate_pages_artist!

    erb = ERB.new(File.open("lib/views/artist.html.erb").read)

    Artist.all.each do |curr_artist|
      output_file = File.open("_site/artists/#{curr_artist.url}", "w")
      output_file.write(erb.result(binding))
      output_file.close
    end

  end

  def generate_pages_genre!
    erb = ERB.new(File.open("lib/views/genre.html.erb").read)

    Genre.all.each do |curr_genre|
      output_file = File.open("_site/genres/#{curr_genre.url}", "w")
      output_file.write(erb.result(binding))
      output_file.close
    end
  end

end