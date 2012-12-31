require 'gaigo/i18n_extend/try_translate'

module Gaigo
  
  module I18nExtend
    I18n.send(:include, TryTranslate)
  end
  
end