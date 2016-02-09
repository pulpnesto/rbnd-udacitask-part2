class LinkItem
  include Listable

  # Instance variables
  attr_reader :description, :site_name, :type
  attr_accessor :priority

  # Initialize new link items with type, description and optional name and priority
  def initialize(type, url, options={})
  	@type = type
    @description = url
    @site_name = options[:site_name]
    @priority = options[:priority]
  end

  # Method to compile site info into a hash
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
