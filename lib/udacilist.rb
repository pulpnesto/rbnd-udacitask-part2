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

  def change_priority(index, degree)
    item = @items[index-1]
    item.priority = degree
  end

  def all
    table_header_array = table_header(@title)
    table_body_array = table_body(@items)
    print_table(table_header_array, table_body_array)
  end


  def filter(item_type)
    item_array = @items.select {|item| item.type == item_type}
    if item_array.empty?
      puts "Sorry, '#{item_type}' does not exist as an item type."
    else
      table_header_array = table_header("Filter by Type: #{item_type}")
      table_body_array = table_body(item_array)
      print_table(table_header_array, table_body_array)
    end
  end

  def find_priority_items(degree)
    item_array = @items.select {|item| item.priority == degree}
    table_header_array = table_header("!! #{degree.capitalize} priority tasks !!")
    table_body_array = table_body(item_array)
    print_table(table_header_array, table_body_array)
  end

  def table_header(title)
    table_array = []
    puts title
    table_array << ['No.',"Type", "Description", "Information", "Priority"]
    table_array << :separator
    table_array
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

  def print_table (header, body)
    rows = []
    header.each {|item| rows << item}
    body.each {|item| rows << item}
    table = Terminal::Table.new :rows => rows
    puts table
    puts ""
  end

  def add_error_check(type, options={})
    raise UdaciListErrors::InvalidTypeError if
                  ( type != "todo" &&
                    type != "link" &&
                    type != "event" )
    raise UdaciListErrors::InvalidPriorityValue if
                  ( options[:priority] != "high" &&
                    options[:priority] != "medium" &&
                    options[:priority] != "low" &&
                    options[:priority] != nil )
  end

end
