require_relative '../lib/work'
require 'minitest/autorun'

class WorkTest
  attr_reader :work
  def setup
    @work = Work.new("example_thumbnail_url", "example_make", "example_model")
  end

  def test_it_has_a_thumbnail_url
    assert_equal work.thumbnail_url, "example_thumbnail_url"
  end

  def test_it_has_a_make
    assert_equal work.thumbnail_url, "example_make"
  end

end
