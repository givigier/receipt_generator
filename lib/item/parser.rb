require_relative "./parser_error"

module Item
  class Parser
    def parse(str:)
      match = str.match(/(?<quantity>\d+) (?<name>.*?) at (?<price>\d+\.\d+)/)
      raise ParserError unless match

      {
        quantity: match[:quantity].to_i,
        name: match[:name],
        price: match[:price].to_f
      }
    end
  end
end
