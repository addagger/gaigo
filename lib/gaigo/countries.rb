require 'gaigo/library/countries'

module Gaigo
  
  class Countries < Array
        
    class Country
      attr_reader :en, :code, :native
      def initialize(en, code, native)
        @en = en
        @code = code
        @native = native
        freeze
      end
      def to_s
        "#{en} (#{native})"
      end
    end
    
    def add_country(attributes)
      self << Country.new(*attributes)
    end
    
    def get(code)
      self.find {|i| i.code == code.to_s}
    end
    
    def codes
      self.map {|i| i.code}
    end
    
  end
  
  COUNTRIES = Countries.new
  Library.countries.each {|attributes| COUNTRIES.add_country(attributes)}
  COUNTRIES.freeze
  
end