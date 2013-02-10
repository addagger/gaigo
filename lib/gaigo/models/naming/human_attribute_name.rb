module Gaigo
  module Naming
    module HumanAttributeName
      extend ActiveSupport::Concern

      included do
        delegate :try_human_attribute_name, :to => "self.class"
      end
  
      module ClassMethods

        def try_human_attribute_name(attribute, options = {}, &block)
          options   = { :count => 1 }.merge!(options)
          parts     = attribute.to_s.split(".")
          attribute = parts.pop
          namespace = parts.join("/") unless parts.empty?
          attributes_scope = "#{self.i18n_scope}.attributes"

          if namespace
            defaults = lookup_ancestors.map do |klass|
              :"#{attributes_scope}.#{klass.model_name.i18n_key}/#{namespace}.#{attribute}"
            end
            defaults << :"#{attributes_scope}.#{namespace}.#{attribute}"
          else
            defaults = lookup_ancestors.map do |klass|
              :"#{attributes_scope}.#{klass.model_name.i18n_key}.#{attribute}"
            end
          end

          if block_given?   #
            yield defaults  #
          end               #

          defaults << :"attributes.#{attribute}"
          defaults << options.delete(:default) if options[:default]

          options[:default] = defaults

          I18n.try_translate(defaults.shift, options) do |args, options|
            options[:default] << attribute.humanize
          end
        end


      end
    end
    
  end
end