class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  def details
    date_hash = {due_date: @due}
    format_description(@description) + "due: " +
    format_date(date_hash) +
    format_priority(@priority)
  end
end
