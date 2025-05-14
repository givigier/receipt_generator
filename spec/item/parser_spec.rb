require "spec_helper"
require "item/parser"
require "item/parser_error"

RSpec.describe Item::Parser do
  describe "#parse" do
    let(:parser) { Item::Parser.new }
    context "when the string is valid" do
      it "parses the string into a hash of an item" do
        expect(parser.parse(str: "1 book at 12.49")).to eq({ name: "book", price: 12.49, quantity: 1 })
      end
    end

    context "when the string is invalid" do
      it "raises a ParserError" do
        expect { parser.parse(str: "1 book") }.to raise_error(Item::ParserError)
        expect { parser.parse(str: "1 book at 10") }.to raise_error(Item::ParserError)
        expect { parser.parse(str: "book at 10") }.to raise_error(Item::ParserError)
      end
    end
  end
end
