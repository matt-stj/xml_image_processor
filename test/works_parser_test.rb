require_relative '../lib/works_repository'
require 'minitest/autorun'

class WorksParserTest < MiniTest::Test
  attr_reader :xml_doc

  def setup
    @xml_doc = WorksLoader.load_from_api(xml_fixture)
    binding.pry
  end

  def test_it

  end

  private

  def xml_fixture
    File.expand_path './fixtures/xml_fixture.xml', __dir__
  end

end
