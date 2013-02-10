module Gaigo
  module Naming
    module HumanModelName
      extend ActiveSupport::Concern

      included do
      end
  
      module ClassMethods
      end
    
      def try_human(options={}, &block)
        options = { :count => 1 }.merge!(options)
        return @human unless @klass.respond_to?(:lookup_ancestors) &&
                             @klass.respond_to?(:i18n_scope)

        defaults = @klass.lookup_ancestors.map do |klass|
          :"#{klass.i18n_scope}.models.#{klass.model_name.i18n_key}" ## changed
        end

        if block_given?   #
          yield defaults  #
        end               #  

        defaults << options.delete(:default) if options[:default]

        options[:default] = defaults

        I18n.try_translate(defaults.shift, options) do
          options[:default] << @human
        end
      end
    end
    
  end
end