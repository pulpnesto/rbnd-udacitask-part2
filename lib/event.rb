class EventItem
  include Listable

  # Instance variables
  attr_reader :description, :start_date, :end_date, :type
  attr_accessor :priority

  # Initialize new event item with description, type and optional priority flag, start date,
  # and end date. The due variable initialization uses the chronic gem to parse dates.
  def initialize(type, description, options={})
    @type = type
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
    @priority = options[:priority]
  end

  # Method to compile event info into a hash
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
