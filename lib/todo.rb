class TodoItem
  include Listable

  # Instance variables
  attr_reader :description, :due, :type
  attr_accessor :priority

  # Initialize new todo item with description, type and optional due dates and priority flag.
  # The due variable initialization uses the chronic gem to parse dates.
  def initialize(type, description, options={})
    @description = description
    @type = type
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  # Method to compile todo info into a hash
  def details
    date_hash = {due_date: @due}
    detail_hash = {}
    detail_hash[:description] = format_description(@description)
    detail_hash[:date] = "due: #{format_date(@type, date_hash)}"
    detail_hash[:priority] = format_priority(@priority)
    detail_hash[:type] = @type
    detail_hash
  end
end
