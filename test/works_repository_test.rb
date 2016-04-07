require_relative '../lib/works_repository'
require 'minitest/autorun'

class WorksRepositoryTest < MiniTest::Test
  attr_reader :works_repository

  def setup
    @works_repo = WorksRepository.new(all_works)
    binding.pry
  end

  def test_it_works
    binding.pry
  end


  private

  def all_works
    works = []
    3.times do |i|
      works << Work.new("thumbnail-#{i}", "make-#{i}", "model#{i}")
    end
    works
  end


end
