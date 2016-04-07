require 'open-uri'
require 'nokogiri'
require_relative 'works_parser'


class WorksLoader
  def self.load_from_api(api_url)
    doc = Nokogiri::XML(open(api_url))
  end
end
