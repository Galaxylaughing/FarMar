require_relative "spec_helper"

describe "Market" do # describe block for each class
  
  describe "#initialize" do # describe block for each function
    let(:market) {
      FarMar::Market.new(1337, "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202")
    }
    
    it "creates an instance of Market" do
      expect(market).must_be_instance_of FarMar::Market
    end
    
    # verifies initialized Market data was saved.
    it "keeps track of ID" do
      expect(market).must_respond_to :id
      expect(market.id).must_equal 1337
    end
    
    it "keeps track of name" do
      expect(market).must_respond_to :name
      expect(market.name).must_equal "People's Co-op Farmers Market"
    end
    
    it "keeps track of address" do
      expect(market).must_respond_to :address
      expect(market.address).must_equal "30th and Burnside"
    end
    
    it "keeps track of city" do
      expect(market).must_respond_to :city
      expect(market.city).must_equal "Portland"
    end
    
    it "keeps track of county" do
      expect(market).must_respond_to :county
      expect(market.county).must_equal "Multnomah"
    end
    
    it "keeps track of state" do
      expect(market).must_respond_to :state
      expect(market.state).must_equal "Oregon"
    end
    
    it "keeps track of zip" do
      expect(market).must_respond_to :zip
      expect(market.zip).must_equal "97202"
    end
    
    # verifies that the ID is the correct format
    it "requires an integer ID" do
      proc {
        FarMar::Market.new("1337", "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202")
      }.must_raise ArgumentError
    end
    
    it "requires a positive integer ID" do
      proc {
        FarMar::Market.new(-1337, "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202")
      }.must_raise ArgumentError
    end
    
  end
  
  describe "#vendors" do
    # returns a list of all vendors with the market_id of the market instance
    let(:market) {
      FarMar::Market.new(1, "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202")
    }
    
    it "returns an empty array for a Market with no vendors" do
      vendorless_market = FarMar::Market.new(1337, "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202")
      expect(vendorless_market.vendors).must_be_instance_of Array
      expect(vendorless_market.vendors).must_be_empty
    end
    
    it "returns a collection of Vendors" do
      expect(market.vendors.length).must_be :>, 0
      expect(market.vendors).must_be_instance_of Array
      market.vendors.each do |single_vendor|
        expect(single_vendor).must_be_instance_of FarMar::Vendor
      end
    end
    
    it "returns the right number of Vendors" do
      expect(market.vendors.length).must_equal 6
    end
    
  end
  
  describe ".all" do
    let(:markets_list) {
      FarMar::Market.all
    }
    
    it "returns an array" do
      expect(markets_list).must_be_instance_of Array
    end
    
    it "returns a collection of Markets" do
      # must run `.each` loop at least once
      expect(markets_list.length).must_be :>, 0
      markets_list.each do |market_in_list|
        expect(market_in_list).must_be_instance_of FarMar::Market
      end
    end
    
    it "returns the correct number of Markets" do
      expect(markets_list.length).must_equal 500
    end
    
    it "gets the first Market from the file" do
      expect(markets_list.first.id).must_equal 1
    end
    
    it "gets the last Market from the file" do
      expect(markets_list.last.id).must_equal 500
    end
  end
  
  describe ".find" do
    it "returns `nil` if no Market is found" do
      market = FarMar::Market.find(12345)
      expect(market).must_be_nil
    end
    
    it "can find the first Market" do
      market = FarMar::Market.find(1)
      expect(market).must_be_instance_of FarMar::Market
      expect(market.zip).must_equal "97202"
    end
    
    it "can find the last Market" do
      market = FarMar::Market.find(500)
      expect(market).must_be_instance_of FarMar::Market
      expect(market.zip).must_equal "10467"
    end
  end
  
end