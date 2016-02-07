class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] || "Untitled"
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    add_error_check(type, options)
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end

  def delete(index)
    raise UdaciListErrors::IndexExceedsListSize if index < 1 || index > @items.length
    @items.delete_at(index - 1)
  end

  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
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

end
