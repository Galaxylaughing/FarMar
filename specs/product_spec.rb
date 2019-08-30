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
  
  describe ".all" do
    let(:products_list) {
      FarMar::Product.all
    }
    
    it "returns an array" do
      expect(products_list).must_be_instance_of Array
    end
    
    it "returns a collection of Products" do
      expect(products_list.length).must_be :>, 0
      products_list.each do |product_in_list|
        expect(product_in_list).must_be_instance_of FarMar::Product
      end
    end
    
    it "returns the correct number of Products" do
      expect(products_list.length).must_equal 8193
    end
    
    it "gets the first Product from the file" do
      expect(products_list.first.id).must_equal 1
    end
    
    it "gets the last Product from the file" do
      expect(products_list.last.id).must_equal 8193
    end
    
  end
  
  describe ".find" do
    it "returns `nil` if no Product is found" do
      product = FarMar::Product.find(1234567)
      expect(product).must_be_nil
    end
    
    it "can find the first Vendor" do
      product = FarMar::Product.find(1)
      expect(product).must_be_instance_of FarMar::Product
      expect(product.id).must_equal 1
    end
    
    it "can find the last Vendor" do
      product = FarMar::Product.find(8193)
      expect(product).must_be_instance_of FarMar::Product
      expect(product.id).must_equal 8193
    end
  end
  
end