class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date

  def initialize(description, options={})
    @description = description
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
  end


  def details
    date_hash = {}
    date_hash[:due_date] = @start_date
    date_hash[:end_date] = @end_date
    format_description(@description) + "event dates: " + format_date(date_hash)
  end
end
