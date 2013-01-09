module Gaigo
  
  module I18nExtend
    module TryTranslate
      extend ActiveSupport::Concern
      
      module ClassMethods
        def try_translate(*args, &block)
          options = args.last.is_a?(Hash) ? args.pop : {}
          locale = options.delete(:locale) || config.locale
          begin
            translate!(*args, options.merge(:locale => locale))
          rescue Exception
            if block_given?
              yield args, options
            end
            translate(*args, options)
          end
         end
      end
    end
    
  end
end