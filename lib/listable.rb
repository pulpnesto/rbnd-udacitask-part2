module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_priority(priority)
    value = " ⇧".colorize(:magenta) if priority == "high"
    value = " ⇨".colorize(:cyan) if priority == "medium"
    value = " ⇩".colorize(:green) if priority == "low"
    value = "" if !priority
    return value
  end

  def format_date(options={})
 #   options[:due_date] = Chronic.parse(options[:due_date])
 #   options[:end_date] = Chronic.parse(options[:end_date])
    if options[:end_date]
      dates = options[:due_date].strftime("%D") + " -- " + options[:end_date].strftime("%D")
    else
      options[:due_date] ? options[:due_date].strftime("%D") : "N/A"
    end
  end

  def format_name(site_name)
    site_name ? site_name : ""
  end
end
