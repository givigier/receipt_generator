module Item
  class Entity
    attr_reader :name, :price, :quantity
    
    def initialize(name:, price:, quantity:)
      @name = name
      @price = price
      @quantity = quantity
    end

    def category
      case @name.downcase
      when /book/ then "books"
      when /chocolate/ then "food"
      when /pill/ then "medical"
      else
        "unknown"
      end
    end

    def imported?
      @name.downcase.include?("imported")
    end
  end
end