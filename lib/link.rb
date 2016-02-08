class LinkItem
  include Listable
  attr_reader :description, :site_name, :type
  attr_accessor :priority

  def initialize(type, url, options={})
  	@type = type
    @description = url
    @site_name = options[:site_name]
    @priority = options[:priority]
  end


  def details
  	detail_hash = {}
    format_description(@description) + "site name: " + format_name(@site_name)
    detail_hash[:type] = @type
    detail_hash[:description] = format_description(@description)
    detail_hash[:date] = @site_name
    detail_hash[:priority] = format_priority(@priority)
    detail_hash
  end
end
