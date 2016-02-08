module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_priority(priority)
    value = "   ⇧".colorize(:magenta) if priority == "high"
    value = "   ⇨".colorize(:red) if priority == "medium"
    value = "   ⇩".colorize(:green) if priority == "low"
    value = "" if !priority
    return value
  end

  def format_date(item_type, options={})
    if options[:end_date]
      dates = options[:due_date].strftime("%D").colorize(:blue) + " -- " + options[:end_date].strftime("%D").colorize(:blue)
    elsif item_type == 'event'
      options[:due_date] ? options[:due_date].strftime("%D").colorize(:blue) : "N/A"
    else
      options[:due_date] ? options[:due_date].strftime("%D").colorize(:blue) : "No due date"
    end
  end

  def format_name(site_name)
    site_name ? site_name : ""
  end
end
