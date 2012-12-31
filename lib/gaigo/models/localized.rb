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
      super(check_locale_code(value))
    end
    
    def lang
      LANGS.get(locale)
    end

  end
end