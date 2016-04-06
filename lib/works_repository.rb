class WorksRepository
  attr_reader :works, :makes, :models, :nested_makes

  def initialize(repo_data)
    @works = repo_data
    @makes = self.works.group_by {|work| work.make}
    @models = self.works.group_by {|work| work.model}
    @nested_makes = makes.map do |make, works|
      makes[make] = works.group_by {|work| work.model}
    end
  end

  def unique_makes
    works.map do |work|
      work.make
    end.uniq
  end

  def unique_models
    works.map do |work|
      work.model
    end.uniq
  end

end
