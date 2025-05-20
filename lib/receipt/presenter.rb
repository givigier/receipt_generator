module Receipt
  class Presenter
    def initialize(data:)
      @receipt_data = data
    end

    def print_receipt
      output = []
      @receipt_data.each do |name:, quantity:, price_with_taxes:|
        output << "#{quantity} #{name}: #{format("%.2f", price_with_taxes)}"
      end
      output << "Sales Taxes: #{format('%.2f', @receipt_data.taxes)}"
      output << "Total: #{format('%.2f', @receipt_data.total)}"
      output.join("\n")
    end
  end
end