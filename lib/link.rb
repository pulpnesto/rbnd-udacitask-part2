class LinkItem
  include Listable
  attr_reader :description, :site_name, :type

  def initialize(type, url, options={})
  	@type = type
    @description = url
    @site_name = options[:site_name]
  end


  def details
  	detail_hash = {}
    format_description(@description) + "site name: " + format_name(@site_name)
    detail_hash[:type] = @type
    detail_hash[:description] = format_description(@description)
    detail_hash[:date] = @site_name
    detail_hash
  end
end
