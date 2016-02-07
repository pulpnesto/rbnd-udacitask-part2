class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] || "Untitled"
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    add_error_check(type, options)
    @items.push TodoItem.new(type, description, options) if type == "todo"
    @items.push EventItem.new(type, description, options) if type == "event"
    @items.push LinkItem.new(type, description, options) if type == "link"
  end

  def delete(index)
    raise UdaciListErrors::IndexExceedsListSize if index < 1 || index > @items.length
    @items.delete_at(index - 1)
  end

  def all
    rows = []
    table_header_array = table_header(@title)
    table_array = table_body(@items)
    table_header_array.each {|item| rows << item}
    table_array.each {|item| rows << item}
    table = Terminal::Table.new :rows => rows
    puts table
  end

  def table_header(title)
    rows = []
    puts title
    rows << ['No.',"Type", "Description", "Information", "Priority"]
    rows << :separator
    rows
  end

  def table_body(items_to_format)
    table_array = []
    items_to_format.each_with_index do |item, position|
      table_parser = item.details
      table_array << ["#{position + 1}",
               table_parser[:type],
               table_parser[:description],
               table_parser[:date],
               table_parser[:priority]]
    end
    table_array
  end

  def add_error_check(type, options={})
    raise UdaciListErrors::InvalidTypeError if (type != "todo" &&
                                                type != "link" &&
                                                type != "event")
    raise UdaciListErrors::InvalidPriorityValue if ( options[:priority] != "high" &&
                                    options[:priority] != "medium" &&
                                    options[:priority] != "low" &&
                                    options[:priority] != nil )
  end

  def filter(item_type)
    rows = []
    table_header_array = table_header("Filter by #{item_type}")
    item_array = @items.select {|item| item.type == item_type}
    table_body_array = table_body(item_array)
    table_header_array.each {|item| rows << item}
    table_body_array.each {|item| rows << item}
    table = Terminal::Table.new :rows => rows
    puts table
  end

end
