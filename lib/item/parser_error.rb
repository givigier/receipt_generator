module Item
  class ParserError < StandardError
    def initialize(message = 'Unexpected string format.')
      super(message)
    end
  end
end