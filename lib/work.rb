class Work
  attr_reader :thumbnail_url, :make, :model

  def initialize(thumbnail_url, make, model)
    @thumbnail_url = thumbnail_url
    @make = make
    @model = model
  end

end
