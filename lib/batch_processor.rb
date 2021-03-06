require_relative 'works_loader'

class BatchProcessor
  attr_reader :api_source, :output_directory

  def initialize(api_source, output_directory)
    @api_source = api_source
    @output_directory = output_directory
  end

  def start
    correct_datatype?(api_source)
    xml_doc = WorksLoader.load_from_api(api_source)
    parsed_xml = WorksParser.parse(xml_doc)
    repository_of_works = WorksRepository.new(parsed_xml)
    HtmlRenderer.new(repository_of_works, output_directory).build
  end

  private

  def correct_datatype?(api_source)
    begin
      if api_source[-4..-1] != ".xml"
        raise
      end
      rescue => ex
        print "api endpoint must return '.xml' data \n #{ex.backtrace.join("\n")}: #{ex.message} (#{ex.class})"
        raise
      end
    end
  end

  this_is_the_program_and_not_the_test = ($PROGRAM_NAME == __FILE__)

  if this_is_the_program_and_not_the_test
    BatchProcessor.new(ARGV[0], ARGV[1]).start
  end
