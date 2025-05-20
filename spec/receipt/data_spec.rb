require "spec_helper"
require "receipt/data"
require "item/entity"
require "tax_calculator"

RSpec.describe Receipt::Data do
  let(:item1) { Item::Entity.new(quantity: 2, name: "book", price: 12.49) }
  let(:item2) { Item::Entity.new(quantity: 1, name: "music CD", price: 14.99) }
  let(:item3) { Item::Entity.new(quantity: 1, name: "imported box of chocolates", price: 10.00) }
  let(:item4) { Item::Entity.new(quantity: 1, name: "imported bottle of perfume", price: 47.50) }

  describe "#total" do
    let(:receipt) { described_class.new(items: [item1, item2, item3, item4], tax_calculator: TaxCalculator) }

    it "calculates the total considering quantities and taxes" do
      expect(receipt.total).to eq(24.98 + 16.49 + 10.50 + 54.65)
    end
  end

  describe "#taxes" do
    let(:receipt) { described_class.new(items: [item1, item2, item3, item4], tax_calculator: TaxCalculator) }

    it "calculates the total taxes for all items" do
      expect(receipt.taxes).to eq(0 + 1.5 + 0.5 + 7.15)
    end
  end

  describe "#each" do
    let(:receipt) { described_class.new(items: [item1, item2, item3, item4], tax_calculator: TaxCalculator) }

    it "calculates the total taxes for all items" do
      items = []
      receipt.each { |args| items.push(args) }
      expect(items).to eq [
        { name: "book", price_with_taxes: 24.98, quantity: 2 },
        { name: "music CD", price_with_taxes: 16.49, quantity: 1 },
        { name: "imported box of chocolates", price_with_taxes: 10.5, quantity: 1 },
        { name: "imported bottle of perfume", price_with_taxes: 54.65, quantity: 1 }
      ]
    end
  end
end 