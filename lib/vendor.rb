module FarMar
  class Vendor
    
    attr_reader :id, :name, :num_employees, :market_id
    
    def initialize(id, name, num_employees:, market_id:)
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError.new("ID must be a positive Integer (got #{id})")
      end
      
      @id = id
      @name = name
      @num_employees = num_employees
      @market_id = market_id
    end
    
  end
end
