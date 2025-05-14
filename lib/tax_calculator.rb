class TaxCalculator
  BASIC_TAX_RATE = 10
  IMPORT_DUTY_RATE = 5
  EXEMPT_CATEGORIES = %w(books food medical).freeze

  def self.calculate_tax(item:)
    tax = 0.0
    tax += BASIC_TAX_RATE unless exempt?(item)
    tax += IMPORT_DUTY_RATE if item.imported?
    
    tax
  end

  private

  def self.exempt?(item)
    EXEMPT_CATEGORIES.include? item.category
  end
end