module FarMar
  class Market
    
    attr_reader :id, :name, :address, :city, :county, :state, :zip
    
    def initialize(id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end
    
  end
end