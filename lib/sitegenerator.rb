class SiteGenerator

  def make_artists_homepage!
    
  end

  def make_genres_homepage!
  end

  def generate_pages_artist!

    erb = ERB.new(File.open("./lib/templates/movie.html.erb").read)

    Movie.all.each do |curr_movie|
      output_file = File.open("./_site/movies/#{curr_movie.url}", "w")
      output_file.write(erb.result(binding))
      output_file.close
    end

  end

  def generate_pages_genre!
  end

end