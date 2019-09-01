module FarMar
  class Market
    
    attr_reader :id, :name, :address, :city, :county, :state, :zip
    
    def initialize(id, name, address, city, county, state, zip)
      unless id.instance_of?(Integer) && id > 0
        raise ArgumentError.new("ID must be a positive Integer (got #{id})")
      end
      
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end
    
    def vendors()
      return Vendor.all.select { |vendor| vendor.market_id == id}
    end
    
    def self.all()
      return CSV.read("support/markets.csv").map do |line|
        Market.new(
          line[0].to_i, #id
          line[1], #name
          line[2], #address
          line[3], #city
          line[4], #county
          line[5], #state
          line[6] #zip
        )
      end
    end
    
    def self.find(market_id)
      return all.find { |market| market.id == market_id }
    end
    
  end
end
