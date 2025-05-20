require_relative "lib/item/parser"
require_relative "lib/item/entity"
require_relative "lib/receipt/data"
require_relative "lib/receipt/presenter"
require_relative 'lib/tax_calculator'

baskets = [
  [
    "2 book at 12.49",
    "1 music CD at 14.99",
    "1 chocolate bar at 0.85"
  ],
  [
    "1 imported box of chocolates at 10.00",
    "1 imported bottle of perfume at 47.50"
  ],
  [
    "1 imported bottle of perfume at 27.99",
    "1 bottle of perfume at 18.99",
    "1 packet of headache pills at 9.75",
    "3 imported boxes of chocolates at 11.25"
  ]
]

parser = Item::Parser.new
baskets.each_with_index do |basket, i|
  puts "=== Basket ##{i} ==="
  items = basket.map do |item_line|
            Item::Entity.new(**parser.parse(str: item_line))
          rescue Item::ParserError
            print "Error parsing item: #{item_line}"
            next
          end
  
  data = Receipt::Data.new(items:, tax_calculator: TaxCalculator)
  puts Receipt::Presenter.new(data:).print_receipt
  puts "\n"
end
