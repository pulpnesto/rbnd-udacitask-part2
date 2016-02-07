class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :type

  def initialize(type, description, options={})
    @description = description
    @type = type
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

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
