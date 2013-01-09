require 'gaigo/models/localized'

module Gaigo
  module HasLocale

    def has_locale!(*args)
      options = args.extract_options!
      class_attribute :_locales unless defined?(_locales)
      self._locales = LANGS.copy(*args)
      unless respond_to?(:has_locale?)
        unless options[:accessible] == false
          attr_accessible :locale
        end
      end
      include Localized
    end
    
  end
end