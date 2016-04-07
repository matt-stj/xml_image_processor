require_relative 'work'
require_relative 'works_repository'
require_relative 'html_renderer'

class WorksParser

  def self.parse(xml_doc)
    repo_data = []
    xml_doc.xpath("//work").each do |work|
      thumbnail_url = work.xpath("urls").at_xpath("url").text

      make = work.xpath("exif//make").text
      make = "Unspecified" if make == ""

      model = work.xpath("exif//model").text
      model = "Unspecified" if model == ""

      repo_data << Work.new(thumbnail_url, make, model)
    end
    works_repo = WorksRepository.new(repo_data)
  end

end
