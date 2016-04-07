class WorksRepository
  attr_reader :works, :makes, :models

  def initialize(repo_data)
    @works = repo_data
    @makes = self.works.group_by {|work| work.make}
    @models = self.works.group_by {|work| work.model}

    makes.map do |make, works|
      makes[make] = works.group_by {|work| work.model}
    end
  end

end
