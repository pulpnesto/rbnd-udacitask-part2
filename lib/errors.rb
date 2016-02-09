module UdaciListErrors
  # Error classes go here

  # Class for invalid item error
  class InvalidItemType < StandardError
  end

  # Class for indicating index is out of rancge of array
  class IndexExceedsListSize < StandardError
  end

  # Class for invalid priority error
  class InvalidPriorityType < StandardError
  end
end
