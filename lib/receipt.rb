require_relative './tax_calculator'

class Receipt
  def initialize(items: [])
    @items = items
    @total = 0
    @taxes = 0
  end

  def total
    @items.sum { |item| total_with_taxes(item:) }
  end

  def taxes
    @items.sum { |item| total_taxes(item:) }
  end

  def to_s
    output = []
    @items.each do |item|
      output << "#{item.quantity} #{item.name}: #{format("%.2f", total_with_taxes(item:))}"
    end
    output << "Sales Taxes: #{format('%.2f', taxes)}"
    output << "Total: #{format('%.2f', total)}"
    output.join("\n")
  end

  private

  def total_with_taxes(item:)
    without_taxes = (item.quantity * item.price)
    without_taxes + total_taxes(item:)
  end

  def total_taxes(item:)
    with_taxes = ((item.quantity * item.price) * TaxCalculator.calculate_tax(item:))/100
    (with_taxes * 20).ceil / 20.0
  end
end