require "spec_helper"
require "item/entity"

RSpec.describe Item::Entity do
  describe "#category" do
    context "when the item name contains book" do
      it "returns books" do
        entity = described_class.new(name: "book", price: 0, quantity: 0)
        expect(entity.category).to eq "books"
      end
    end

    context "when the item name contains chocolate" do
      it "returns food" do
        entity = described_class.new(name: "chocolate bar", price: 0, quantity: 0)
        expect(entity.category).to eq "food"
      end
    end

    context "when the item name contains pill" do
      it "returns medical" do
        entity = described_class.new(name: "headache pills", price: 0, quantity: 0)
        expect(entity.category).to eq "medical"
      end
    end

    context "when the item name contains perfume" do
      it "returns unknown" do
        entity = described_class.new(name: "perfume", price: 0, quantity: 0)
        expect(entity.category).to eq "unknown"
      end
    end

    context "when the item name contains keywords in different cases" do
      it "returns the correct category" do
        entity = described_class.new(name: "BOOK", price: 0, quantity: 0)
        expect(entity.category).to eq "books"
      end
    end
  end

  describe "#imported?" do
    context "when the item has imported on it's name" do
      it "returns true" do
        entity = described_class.new(name: "imported chocolate", price: 0, quantity: 0)
        expect(entity.imported?).to be_truthy
      end
    end

    context "when the item is not imported" do
      it "returns false" do
        entity = described_class.new(name: "chocolate", price: 0, quantity: 0)
        expect(entity.imported?).to be_falsey
      end
    end

    context "when the item name contains 'imported' in different cases" do
      it "returns true" do
        entity = described_class.new(name: "IMPORTED chocolate", price: 0, quantity: 0)
        expect(entity.imported?).to be_truthy
      end
    end
  end
end
