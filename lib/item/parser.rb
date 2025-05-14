require_relative "./parser_error"

module Item
  class Parser
    def parse(str:)
      match = str.match(/\A(?<quantity>\d+) (?<name>.*?) at (?<price>\d+\.\d+)\z/)
      raise ParserError unless match

      {
        quantity: match[:quantity].to_i,
        name: match[:name],
        price: match[:price].to_f
      }
    end
  end
end
