require_relative "spec_helper"

describe "Product" do
  
  describe "#initialize" do
    let(:product) {
      FarMar::Product.new(1, "Dry Beets", vendor_id: 1)
    }
    
    it "creates an instance of Product" do
      expect(product).must_be_instance_of FarMar::Product
    end
    
    # verifies initialized Product data was saved.
    it "keeps track of ID" do
      expect(product).must_respond_to :id
      expect(product.id).must_equal 1
    end
    
    it "keeps track of name" do
      expect(product).must_respond_to :name
      expect(product.name).must_equal "Dry Beets"
    end
    
    it "keeps track of vendor ID" do
      expect(product).must_respond_to :vendor_id
      expect(product.vendor_id).must_equal 1
    end
    
    # verifies that the ID is the correct format
    it "requires an Integer ID" do
      proc {
        FarMar::Product.new("1", "Dry Beets", vendor_id: 1)
        
      }.must_raise ArgumentError
    end
    
    it "requires a positive Integer ID" do
      proc {
        FarMar::Product.new(-1, "Dry Beets", vendor_id: 1)
      }.must_raise ArgumentError
    end
    
    # verifies that the vendor ID is the correct format
    it "requires an Integer Vendor ID" do
      proc {
        FarMar::Product.new(1, "Dry Beets", vendor_id: "1")
        
      }.must_raise ArgumentError
    end
    
    it "requires a positive Integer Vendor ID" do
      proc {
        FarMar::Product.new(1, "Dry Beets", vendor_id: -1)
      }.must_raise ArgumentError
    end
    
  end
  
end