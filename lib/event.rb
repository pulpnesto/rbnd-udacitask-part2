class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date, :type
  attr_accessor :priority

  def initialize(type, description, options={})
    @type = type
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
    @priority = options[:priority]
  end


  def details
    detail_hash = {}
    date_hash = {due_date: @start_date, end_date: @end_date}
    detail_hash[:type] = @type
    detail_hash[:description] = format_description(@description)
    detail_hash[:date] = "event dates: " + format_date(@type, date_hash)
    detail_hash[:priority] = format_priority(@priority)
    detail_hash
  end
end
