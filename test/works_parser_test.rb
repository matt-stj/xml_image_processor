require_relative '../lib/works_repository'
require 'minitest/autorun'

class WorksParserTest < MiniTest::Test
  attr_reader :xml_doc

  def setup
    @xml_doc = WorksLoader.load_from_api(xml_fixture)
  end

  def test_it_accepts_xml_and_returns_an_array_of_work_objects
    assert_equal xml_doc.class, Nokogiri::XML::Document

    parsed_xml = WorksParser.parse(xml_doc)

    assert_equal parsed_xml.class, Array
    parsed_xml.each do |work|
      assert_equal work.class, Work
    end
  end

  def test_if_no_data_is_provided_the_make_or_model_is_stored_as_unspecifed
    xml_doc = WorksLoader.load_from_api(incomplete_exif_data)

    parsed_xml = WorksParser.parse(xml_doc)

    parsed_xml.each do |work|
      assert_equal work.make, "Unspecified"
      assert_equal work.model, "Unspecified"
    end
  end

  private

  def xml_fixture
    File.expand_path './fixtures/xml_fixture.xml', __dir__
  end

  def incomplete_exif_data
    File.expand_path './fixtures/incomplete_exif_data.xml', __dir__
  end

end
