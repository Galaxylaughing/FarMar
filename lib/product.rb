module FarMar
  class Product < Loadable
    
    attr_reader :name, :vendor_id
    
    def initialize(id, name, vendor_id:)
      super(id)
      expect_positive_int(vendor_id)
      
      @name = name
      @vendor_id = vendor_id
    end
    
    def vendor()
      Vendor.find(vendor_id)
    end
    
    def self.from_csv_line(line)
      return Product.new(
        line[0].to_i, #id
        line[1], #name
        vendor_id: line[2].to_i
      )
    end
    
    def self.csv_filename()
      return "support/products.csv"
    end
    
    def self.find_by_vendor(vendor_id)
      return all.select { |product| product.vendor_id == vendor_id }
    end
    
    private
    
    def expect_positive_int(variable)
      unless variable.instance_of?(Integer) && variable > 0
        raise ArgumentError.new("Expected Positive Integer, Got #{variable}")
      end
    end
    
  end
end
