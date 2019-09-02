module FarMar
  class Market < Loadable
    
    attr_reader :name, :address, :city, :county, :state, :zip
    
    def initialize(id, name, address, city, county, state, zip)
      super(id)
      
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
    
    def self.from_csv_line(line)
      return Market.new(
        line[0].to_i, #id
        line[1], #name
        line[2], #address
        line[3], #city
        line[4], #county
        line[5], #state
        line[6] #zip
      )
    end
    
    def self.csv_filename()
      return "support/markets.csv"
    end
    
  end
end
