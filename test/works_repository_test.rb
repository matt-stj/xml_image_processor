require_relative '../lib/works_repository'
require 'minitest/autorun'

class WorksRepositoryTest < MiniTest::Test
  attr_reader :works_repo

  def setup
    @works_repo = WorksRepository.new(all_works)
  end

  def test_it_contains_a_collection_of_works
    assert works_repo.works
    works_repo.works.each do |work|
      assert_equal work.class, Work
    end
  end

  def test_it_contains_a_nested_hash_of_makes_models_and_works
    assert works_repo.makes_and_models
    assert_equal works_repo.makes_and_models.class, Hash

    i = 0
    works_repo.makes_and_models.each do |make, model_hash|
      assert_equal make, "make-#{i}"
      model_hash.each do |model, work|
        assert_equal model, "model-#{i}"
        assert_equal work.class, Array
        assert_equal work.first.class, Work
      end
      i +=1
    end
  end

  def test_it_groups_models_of_the_same_make_together
    repo = WorksRepository.new(duplicate_makes)

    assert_equal repo.makes_and_models["make"].count, 2
  end


  private

  def all_works
    works = []
    3.times do |i|
      works << Work.new("thumbnail-#{i}", "make-#{i}", "model-#{i}")
    end
    works
  end

  def duplicate_makes
    works = []
    2.times do |i|
      works << Work.new("thumbnail-#{i}", "make", "model-#{i}")
    end
    works
  end


end
