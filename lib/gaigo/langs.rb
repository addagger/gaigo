require 'gaigo/library/langs'

module Gaigo
  
  class Langs < Array
    
    class Lang
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
      def to_method
        en.downcase.gsub(/\W|\d/,"_")
      end
    end
    
    def add_lang(attributes)
      self << Lang.new(*attributes)
    end
    
    def get(code)
      self.find {|i| i.code == code.to_s}
    end
    
    def codes
      self.map {|i| i.code}
    end
    
    def en
      self.map {|i| i.en}
    end
    
    def native
      self.map {|i| i.native}
    end
    
    def copy(*locale_codes)
      if locale_codes.any?
        Langs.new.tap do |new_langs|
          locale_codes.each do |code|
            new_langs << get(code.to_s)
          end
        end
      else
        self.dup
      end
    end
    
  end
  
  LANGS = Langs.new
  Library.langs.each {|attributes| LANGS.add_lang(attributes)}
  LANGS.freeze

end