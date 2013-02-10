module Gaigo
  module Localized
    extend ActiveSupport::Concern

    module ClassMethods
      def has_locale?
        true
      end
    end

    def try_native_attribute_name(attribute, options = {})
      try_human_attribute_name(attribute, options.merge(:locale => locale))
    end

    def locale=(value)
      code = check_locale_code(value)
      self._locales.validate_codes(code, :raise => true)
      super(code)
    end
    
    def lang
      self._locales.get(locale)
    end

    def lang_method
      lang.try(:to_method)
    end

  end
end