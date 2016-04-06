require_relative 'works_loader'
require 'pry'

class BatchProcessor
  attr_reader :api_source, :output_directory

  def initialize(api_source, output_directory)
    @api_source = api_source
    @output_directory = output_directory
  end

  def start
    repository_of_works = WorksLoader.load_from_api(api_source)
    renderer = HtmlRenderer.new(repository_of_works, output_directory).build
  end

end

this_is_the_program_and_not_the_test = ($PROGRAM_NAME == __FILE__)

if this_is_the_program_and_not_the_test
  BatchProcessor.new(ARGV[0], ARGV[1]).start
end
