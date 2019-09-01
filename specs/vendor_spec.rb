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
  
  describe "#products" do
    
    it "returns empty array if vendor has no products" do
      # Assumption: there is no vendor with the ID 10,000
      nonexistent_id = 10_000
      vendor = FarMar::Vendor.new(nonexistent_id, "vendor name", num_employees: 10, market_id: 10)
      
      products_list = vendor.products()
      
      expect(products_list).must_be_instance_of Array
      expect(products_list).must_be_empty
    end
    
    it "returns an array of one if vendor has one product" do
      # data =  4,Yummy Fruit,3
      vendor_id = 3
      vendor = FarMar::Vendor.find(vendor_id)
      
      product_list = vendor.products()
      
      expect(product_list).must_be_instance_of Array
      expect(product_list.length).must_equal 1
      product_list.each do |single_product|
        expect(single_product).must_be_instance_of FarMar::Product
        expect(single_product.vendor_id).must_equal vendor_id
      end
    end
    
    it "returns an array of many products if vendor has many products" do
      # data =  5,Green Apples,4
      #         6,Smooth Mushrooms,4
      #         7,Quaint Beef,4
      vendor_id = 4
      vendor = FarMar::Vendor.find(vendor_id)
      
      product_list = vendor.products()
      
      expect(product_list).must_be_instance_of Array
      expect(product_list.length).must_equal 3
      product_list.each do |single_product|
        expect(single_product).must_be_instance_of FarMar::Product
        expect(single_product.vendor_id).must_equal vendor_id
      end
    end
    
    
  end
  
  describe "#market" do
    let(:vendor) {
      FarMar::Vendor.new(6, "Zulauf and Sons", num_employees: 8, market_id: 1)
    }
    
    it "returns a Market instance" do
      expect(vendor.market).must_be_instance_of FarMar::Market
    end
    
    it "returns the Market instance associated with the vendor" do
      expect(vendor.market.vendors.last.id).must_equal 6
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
  
  describe ".find" do
    it "returns `nil` if no Vendor is found" do
      vendor = FarMar::Vendor.find(123456)
      expect(vendor).must_be_nil
    end
    
    it "can find the first Vendor" do
      vendor = FarMar::Vendor.find(1)
      expect(vendor).must_be_instance_of FarMar::Vendor
      expect(vendor.id).must_equal 1
    end
    
    it "can find the last Vendor" do
      vendor = FarMar::Vendor.find(2690)
      expect(vendor).must_be_instance_of FarMar::Vendor
      expect(vendor.id).must_equal 2690
    end
  end  
  
end
