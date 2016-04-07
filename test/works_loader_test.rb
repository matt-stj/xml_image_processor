require_relative '../lib/works_loader'
require 'minitest/autorun'


class WorksLoaderTest < Minitest::Test

  def test_it_returns_a_nokogiri_object
    api_url = "http://take-home-test.herokuapp.com/api/v1/works.xml"
    loaded_works = WorksLoader.load_from_api(api_url)

    assert_equal loaded_works.class, Nokogiri::XML::Document
  end

end
