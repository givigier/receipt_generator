require_relative "lib/item/parser"
require_relative "lib/item/entity"

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

  items.each { |item| puts item.to_s }
end
