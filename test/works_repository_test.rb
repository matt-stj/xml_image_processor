require_relative '../lib/works_repository'
require 'minitest/autorun'

class WorksRepositoryTest < MiniTest::Test
  attr_reader :works_repository

  def setup
    @works_repo = Work.new("example_thumbnail_url", "example_make", "example_model")
  end

  

end
