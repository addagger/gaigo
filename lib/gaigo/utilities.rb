module Gaigo

  module Utilities
    
    def check_locale_code(code)
      if lang = LANGS.get(code)
        lang.code
      else
        raise(Exception, "Unacceptable locale code: #{code}")
      end
    end
  
    def check_country_code(code)
      if country = COUNTRIES.get(code)
        country.code
      else
        raise(Exception, "Unacceptable country code: #{code}")
      end
    end
    
  end 
  
end