require_relative '../lib/batch_processor'
require 'minitest/autorun'
require 'fileutils'

class BatchProcessorTest < Minitest::Test
  attr_reader :batch_processor

  def setup
    @batch_processor = BatchProcessor.new(api_url, path)
  end

  def test_api_url_must_return_xml_datatype
    assert_raises RuntimeError do
      supress_stdout { BatchProcessor.new("hi.json", path).start }
    end
  end

  def test_batch_processor_accepts_an_api_source_as_a_first_argument_and_an_output_dir_as_a_second
    assert_equal batch_processor.api_source, "http://take-home-test.herokuapp.com/api/v1/works.xml"
    assert_equal batch_processor.output_directory, path
  end

  def test_batch_processor_will_output_files_to_correct_output_directory
    refute directory_exists?((path + "/output"))
    supress_stdout { batch_processor.start }
    assert directory_exists?((path + "/output"))
  end

  MiniTest.after_run { FileUtils.rm_rf((File.expand_path File.dirname(__FILE__) + "/output")) if File.directory?((File.expand_path File.dirname(__FILE__) + "/output")) }

  private

  def directory_exists?(directory)
    File.directory?(directory)
  end

  def path
    File.expand_path File.dirname(__FILE__)
  end

  def api_url
    "http://take-home-test.herokuapp.com/api/v1/works.xml"
  end

  def supress_stdout(&block)
    original_stdout = $stdout
    $stdout = fake = StringIO.new
    begin
      yield
    ensure
      $stdout = original_stdout
    end
    fake.string
  end

end
