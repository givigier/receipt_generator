require "spec_helper"
require "tax_calculator"

RSpec.describe TaxCalculator do
  describe ".calculate" do
    context "when item is not exempt and not imported" do
      let(:item) { double("Item", imported?: false, category: "unknown") }

      it "applies only basic tax" do
        expect(described_class.calculate(item: item)).to eq(10)
      end
    end

    context "when item is not exempt and is imported" do
      let(:item) { double("Item", imported?: true, category: "unknown") }

      it "applies both basic tax and import duty" do
        expect(described_class.calculate(item: item)).to eq(15)
      end
    end

    context "when item is exempt and not imported" do
      let(:item) { double("Item", imported?: false, category: "books") }

      it "applies no tax" do
        expect(described_class.calculate(item: item)).to eq(0)
      end
    end

    context "when item is exempt and imported" do
      let(:item) { double("Item", imported?: true, category: "books") }

      it "applies only import duty" do
        expect(described_class.calculate(item: item)).to eq(5)
      end
    end
  end
end 