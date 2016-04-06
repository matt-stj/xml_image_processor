require_relative 'work'
require_relative 'works_repository'
require_relative 'html_renderer'

require 'pry'

class WorksParser

  def self.parse(xml_doc)
    repo_data = []
    xml_doc.xpath("//work").each do |work|
      thumbnail_url = work.xpath("urls").at_xpath("url").text
      make = work.xpath("exif//make").text
      model = work.xpath("exif//model").text
      repo_data << Work.new(thumbnail_url, make, model)
    end
    works_repo = WorksRepository.new(repo_data)
  end

end
