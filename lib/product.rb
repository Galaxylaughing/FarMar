module FarMar
  class Product
    
    attr_reader :id, :name, :vendor_id
    
    def initialize(id, name, vendor_id:)
      expect_positive_int(id)
      expect_positive_int(vendor_id)
      
      @id = id
      @name = name
      @vendor_id = vendor_id
    end
    
    def vendor()
      Vendor.find(vendor_id)
    end
    
    def self.all
      return CSV.read("support/products.csv").map do |line|
        Product.new(
          line[0].to_i, #id
          line[1], #name
          vendor_id: line[2].to_i
        )
      end
    end
    
    def self.find(product_id)
      return all.find { |product| product.id == product_id }
    end
    
    private
    
    def expect_positive_int(variable)
      unless variable.instance_of?(Integer) && variable > 0
        raise ArgumentError.new("Expected Positive Integer, Got #{variable}")
      end
    end
    
  end
end
