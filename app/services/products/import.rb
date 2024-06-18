module Products
  class Import
    def initialize(spreadsheet:)
      @spreadsheet = Roo::Spreadsheet.open(spreadsheet)
      @errors = []
    end

    def call
      @spreadsheet.each_with_pagename do |name, sheet|
        @sheet_errors = []
        next if sheet.first_column.nil?

        sheet.each(lm: 'lm', name: 'name', free_shipping: 'free_shipping', description: 'description', price: 'price') do |hash|
          product = Product.new(hash)

          if product.valid?
            product.save
          else
            @sheet_errors << "Product lm: #{product.lm} -> errors: #{product.errors.messages}"
          end
        end

        @errors << @sheet_errors
      end
      puts @errors
    end
  end
end
