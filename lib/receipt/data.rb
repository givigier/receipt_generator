module Receipt
  class Data
    def initialize(items: [], tax_calculator:)
      @items = items
      @tax_calculator = tax_calculator
    end

    def total
      @items.sum { |item| item_with_taxes(item:) }
    end

    def taxes
      @items.sum { |item| item_taxes(item:) }
    end

    def each
      @items.each do |item|
        yield(name: item.name, quantity: item.quantity, price_with_taxes: item_with_taxes(item:))
      end
    end

    private

    def item_with_taxes(item:)
      without_taxes = (item.quantity * item.price)
      (without_taxes + item_taxes(item:)).round(2)
    end

    def item_taxes(item:)
      with_taxes = ((item.quantity * item.price) * @tax_calculator.calculate(item:))/100
      ((with_taxes * 20).ceil / 20.0).round(2)
    end
  end
end