module FarMar
  class Vendor < Loadable
    
    attr_reader :name, :num_employees, :market_id
    
    def initialize(id, name, num_employees:, market_id:)
      super(id)
      
      @name = name
      @num_employees = num_employees
      @market_id = market_id
    end
    
    def products()
      return Product.find_by_vendor(id)
    end
    
    def market()
      return Market.find(self.market_id)
    end
    
    def self.from_csv_line(line)
      return self.new(
        line[0].to_i, #id
        line[1], #name
        num_employees: line[2].to_i,
        market_id: line[3].to_i
      )
    end
    
    def self.csv_filename()
      return "support/vendors.csv"
    end
    
    def self.find_by_market(market_id)
      return nil unless Market.find(market_id)
      return Vendor.all.select { |vendor| vendor.market_id == market_id}
    end
    
  end
end
