require_relative "spec_helper"

describe "Vendor" do
  
  describe "#initialize" do
    let(:vendor) {
      FarMar::Vendor.new(1, "Feil-Farrell", num_employees: 8, market_id: 1)
    }
    
    it "creates an instance of Vendor" do
      expect(vendor).must_be_instance_of FarMar::Vendor
    end
    
    # verifies initialized Vendor data was saved.
    it "keeps track of ID" do
      expect(vendor).must_respond_to :id
      expect(vendor.id).must_equal 1
    end
    
    it "keeps track of name" do
      expect(vendor).must_respond_to :name
      expect(vendor.name).must_equal "Feil-Farrell"
    end
    
    it "keeps track of number of employees" do
      expect(vendor).must_respond_to :num_employees
      expect(vendor.num_employees).must_equal 8
    end
    
    it "keeps track of market id" do
      expect(vendor).must_respond_to :market_id
      expect(vendor.market_id).must_equal 1
    end
    
    # verifies that the ID is the correct format
    it "requires an Integer ID" do
      proc {
        FarMar::Vendor.new("1", "Feil-Farell", num_employees: 8, market_id: 1)
      }.must_raise ArgumentError
    end
    
    it "requires a positive Integer ID" do
      proc {
        FarMar::Vendor.new(-1, "Feil-Farrell", num_employees: 8, market_id: 1)
      }.must_raise ArgumentError
    end
    
  end
  
  describe ".all" do
    let(:vendors_list) {
      FarMar::Vendor.all
    }
    
    it "returns an array" do
      expect(vendors_list).must_be_instance_of Array
    end
    
    it "returns a collection of Vendors" do
      expect(vendors_list.length).must_be :>, 0
      vendors_list.each do |vendor_in_list|
        expect(vendor_in_list).must_be_instance_of FarMar::Vendor
      end
    end
    
    it "returns the correct number of Vendors" do
      expect(vendors_list.length).must_equal 2690
    end
    
    it "gets the first Vendor from the file" do
      expect(vendors_list.first.id).must_equal 1
    end
    
    it "gets the last Vendor from the file" do
      expect(vendors_list.last.id).must_equal 2690
    end
  end
  
  # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  describe ".find" do
  end  
  
end
