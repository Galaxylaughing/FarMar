module FarMar
  class Loadable
    
    attr_reader :id
    
    def initialize(id)
      expect_positive_int(id)
      @id = id
    end
    
    def expect_positive_int(variable)
      unless variable.instance_of?(Integer) && variable > 0
        raise ArgumentError.new("Expected Positive Integer, Got #{variable}")
      end
    end
    
    def self.from_csv_line(line)
      raise NotImplementedError.new("Implement this in a subclass")
    end
    
    def self.csv_filename
      raise NotImplementedError.new("Implement this in a subclass")
    end
    
    def self.all
      return CSV.read(self.csv_filename).map do |line|
        self.from_csv_line(line)
      end
    end
    
    def self.find(id)
      return all.find { |entry| entry.id == id }
    end
    
  end
end