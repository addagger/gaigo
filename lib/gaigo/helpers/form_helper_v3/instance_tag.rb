module Gaigo
  
  module FormHelperV3
    module InstanceTag
      def to_ilabel_tag(text = nil, options = {}, &block)
        options = options.stringify_keys
        tag_value = options.delete("value")
        name_and_id = options.dup

        if name_and_id["for"]
          name_and_id["id"] = name_and_id["for"]
        else
          name_and_id.delete("id")
        end

        current_locale =
        if options[:locale].present?
          check_locale_code(options[:locale])
        elsif object && object.class.respond_to?(:has_locale?)
          object.locale
        else
          I18n.locale
        end

        add_default_name_and_id_for_value(tag_value, name_and_id)
        options.delete("index")
        options.delete("namespace")
        options["for"] ||= name_and_id["id"]

        if block_given?
          @template_object.label_tag(name_and_id["id"], options, &block)
        else
          content = if text.blank?
            object_name.gsub!(/\[(.*)_attributes\]\[\d\]/, '.\1')
            method_and_value = tag_value.present? ? "#{method_name}.#{tag_value}" : method_name

            if object.respond_to?(:to_model)
              key = object.class.model_name.i18n_key
              i18n_default = ["#{key}.#{method_and_value}".to_sym, ""]
            end

            i18n_default ||= ""
            I18n.try_translate("#{object_name}.#{method_and_value}", :locale => (object ? object.try(:locale) : nil), :default => i18n_default, :scope => "helpers.label").presence
          else
            text.to_s
          end

          content ||= if object && object.class.respond_to?(:try_human_attribute_name)
            object.class.try_human_attribute_name(@method_name, :locale => current_locale)
          elsif object && object.class.respond_to?(:human_attribute_name)
            object.class.human_attribute_name(method_name)
          end

          content ||= method_name.humanize

          label_tag(name_and_id["id"], content, options)
        end
      end
    end
  end
  
end