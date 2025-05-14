require "spec_helper"
require "receipt"
require "item/entity"

RSpec.describe Receipt do
  let(:item1) { Item::Entity.new(quantity: 2, name: "book", price: 12.49) }
  let(:item2) { Item::Entity.new(quantity: 1, name: "music CD", price: 14.99) }
  let(:item3) { Item::Entity.new(quantity: 1, name: "imported box of chocolates", price: 10.00) }
  let(:item4) { Item::Entity.new(quantity: 1, name: "imported bottle of perfume", price: 47.50) }

  describe "#total" do
    let(:receipt) { described_class.new(items: [item1, item2, item3, item4]) }

    it "calculates the total considering quantities and taxes" do
      expect(receipt.total).to eq(24.98 + 16.49 + 10.50 + 54.65)
    end
  end

  describe "#taxes" do
    let(:receipt) { described_class.new(items: [item1, item2, item3, item4]) }

    it "calculates the total taxes for all items" do
      expect(receipt.taxes).to eq(0 + 1.5 + 0.5 + 7.15)
    end
  end

  describe "#to_s" do
    let(:receipt) { described_class.new(items: [item1, item2, item3, item4]) }

    it "formats the receipt with quantities" do
      output = [
        "2 book: 24.98",
        "1 music CD: 16.49",
        "1 imported box of chocolates: 10.50", 
        "1 imported bottle of perfume: 54.65",
        "Sales Taxes: 9.15",
        "Total: 106.62"
      ].join("\n")
      expect(receipt.to_s).to eq(output)
    end
  end
end 