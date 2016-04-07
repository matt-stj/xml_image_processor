class WorksRepository
  attr_reader :works, :makes_and_models, :models

  def initialize(repo_data)
    @works = repo_data
    @makes_and_models = self.works.group_by {|work| work.make}
    @models = self.works.group_by {|work| work.model}

    makes_and_models.map do |make, works|
      makes_and_models[make] = works.group_by {|work| work.model}
    end
  end

end
