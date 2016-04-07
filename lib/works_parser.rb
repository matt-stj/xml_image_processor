require_relative 'work'
require_relative 'works_repository'
require_relative 'html_renderer'

class WorksParser

  def self.parse(xml_doc)
    all_works = []
    xml_doc.xpath("//work").each do |work|
      thumbnail_url = work.xpath("urls").at_xpath("url").text

      make = work.xpath("exif//make").text
      make = "Unspecified" if make == ""

      model = work.xpath("exif//model").text
      model = "Unspecified" if model == ""

      all_works << Work.new(thumbnail_url, make, model)
    end
    all_works
  end

end
