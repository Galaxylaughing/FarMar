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
    
    def self.all
      return CSV.read("support/vendors.csv").map do |line|
        Vendor.new(
          line[0].to_i, #id
          line[1], #name
          num_employees: line[2].to_i,
          market_id: line[3].to_i
        )
      end
    end
    
  end
end
