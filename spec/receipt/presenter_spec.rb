require "spec_helper"
require "receipt/data"
require "receipt/presenter"
require "item/entity"
require "tax_calculator"

RSpec.describe Receipt::Presenter do
  let(:item1) { Item::Entity.new(quantity: 2, name: "book", price: 12.49) }
  let(:item2) { Item::Entity.new(quantity: 1, name: "music CD", price: 14.99) }
  let(:item3) { Item::Entity.new(quantity: 1, name: "imported box of chocolates", price: 10.00) }
  let(:item4) { Item::Entity.new(quantity: 1, name: "imported bottle of perfume", price: 47.50) }

  describe "#print_receipt" do
    let(:data) { Receipt::Data.new(items: [item1, item2, item3, item4], tax_calculator: TaxCalculator) }
    let(:receipt) { described_class.new(data:) }

    it "formats the receipt with quantities" do
      output = [
        "2 book: 24.98",
        "1 music CD: 16.49",
        "1 imported box of chocolates: 10.50", 
        "1 imported bottle of perfume: 54.65",
        "Sales Taxes: 9.15",
        "Total: 106.62"
      ].join("\n")
      expect(receipt.print_receipt).to eq(output)
    end
  end
end 