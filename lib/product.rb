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
    
    private
    
    def expect_positive_int(variable)
      unless variable.instance_of?(Integer) && variable > 0
        raise ArgumentError.new("Expected Positive Integer, Got #{variable}")
      end
    end
    
  end
end