require 'gaigo/library/langs'

module Gaigo
  
  class Langs < Array
    
    class Lang
      attr_reader :en, :code, :native
      def initialize(en, code, native)
        @en = en
        @code = code
        @native = native.encode('UTF-8')
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

    def get_by_method(method)
      self.find {|i| i.to_method == method.to_s}
    end

    def get_by_native(name)
      self.find {|i| i.native.mb_chars.downcase.to_s == name.encode('UTF-8').mb_chars.downcase.to_s}
    end

    def get_by_en(name)
      self.find {|i| i.en.downcase == name.downcase.to_s}
    end
    
    def get_by_name(name)
      get_by_native(name)||get_by_english(name)
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

    def validate_codes(*args)
      options = args.extract_options!
      codes = self.codes
      args.map(&:to_s).select do |code|
        if code.to_s.in?(codes)
          true
        else
          options[:raise] == true ? raise(Exception, "Invalid code: :#{code}") : false
        end
      end
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