class HtmlRenderer
  attr_reader :repo_data, :output_directory

  def initialize(repo_data, output_directory)
    @repo_data = repo_data
    @output_directory = output_directory
  end

  def build
    create_directories
    build_index
    build_makes_pages
    build_models_pages
  end

end

private

def create_directories
  Dir.mkdir "#{output_directory}/output" unless File.exists?(output_directory + "/output")
  Dir.mkdir "#{output_directory}/output/makes" unless File.exists?(output_directory + "/output/makes")
  Dir.mkdir "#{output_directory}/output/models" unless File.exists?(output_directory + "/output/models")
end

def build_index
  title = "<h1>Index</h1>"

  navigation = repo_data.makes.keys.map do |make|
    "<li><a href='#{output_directory}/output/makes/#{make.downcase.gsub(' ', '-')}.html'>" + make + "</a></li>"
  end.join("")

  thumbnails = repo_data.works.first(10).map do |work|
    "<img src=" + work.thumbnail_url + ">"
  end.join

  html = title + "<br>" + "<ul>" + navigation + "</ul>" + "<br>" + thumbnails
  output = "#{output_directory}/output/index.html"
  File.write(output, html)
  puts "wrote index.html to #{output}"
end

def build_makes_pages
  grouped = repo_data.works.group_by {|x| x.make}
  grouped.map do |make, works|
    title = "<h1>Make: #{make}</h1>"

    models = works.map {|work| work.model}.uniq

    nav = models.map do |model|
      "<li><a href='#{output_directory}/output/models/#{model.downcase.gsub(' ', '-')}.html'>" + model + "</a></li>"
    end.join("")

    thumbnails = works.first(10).map do |work|
      "<img src=" + work.thumbnail_url + ">"
    end.join("")

    html = title + "<br>" + "<ul>" + nav + "</ul>" + "<br>" + thumbnails
    File.write("#{output_directory}/output/makes/#{make.downcase.gsub(' ', '-')}.html", html)
    puts "wrote makes files to to #{output_directory}"

  end

end


def build_models_pages

  repo_data.makes.map do |make, models|
    models.map do |model, works|
      title = "<h1>Make: #{make}  >>  Model: #{model}</h1>"
      nav =         "<a href='#{output_directory}/output/makes/#{make.downcase.gsub(' ', '-')}.html'>" + make + "</a>"
      thumbnails = works.first(10).map do |work|
        "<img src=" + work.thumbnail_url + ">"
      end.join
      html = title + "<br>" + nav + "<br>" + thumbnails
      File.write("#{output_directory}/output/models/#{model.downcase.gsub(' ', '-')}.html", html)
      puts "wrote models files to to #{output_directory}"
    end
  end


end
