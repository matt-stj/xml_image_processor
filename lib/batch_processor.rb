require_relative 'works_loader'
require 'pry'

class BatchProcessor
  attr_reader :api_source, :output_directory

  def initialize
    @api_source = ARGV[0]
    @output_directory = ARGV[1]
  end

  def start
    repository_of_works = WorksLoader.load_from_api(api_source)

    Dir.mkdir "#{output_directory}/output"
    Dir.mkdir "#{output_directory}/output/makes"
    Dir.mkdir "#{output_directory}/output/models"

    renderer = HtmlRenderer.new(repository_of_works, output_directory).build
  end

  # im_running_the_program_and_not_a_test = ($PROGRAM_NAME == __FILE__)
  #
  # if im_running_the_program_and_not_a_test
  #   api_source = ARGV[0]
  #   output_directory = ARGV[1]
  # end

  # output = File.open(ARGV[1], 'w')

  BatchProcessor.new.start

end
