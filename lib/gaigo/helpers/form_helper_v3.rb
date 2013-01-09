require 'gaigo/helpers/form_helper_v3/form_builder'
require 'gaigo/helpers/form_helper_v3/instance_tag'

module Gaigo

  module FormHelper
    # module_eval <<-EOV
    def ilabel(object_name, method, content_or_options = nil, options = nil, &block)
      options ||= {}

      content_is_options = content_or_options.is_a?(Hash)
      if content_is_options || block_given?
        options.merge!(content_or_options) if content_is_options
        text = nil
      else
        text = content_or_options
      end

      ActionView::Helpers::InstanceTag.new(object_name, method, self, options.delete(:object)).to_ilabel_tag(text, options, &block)
    end
  end
  
end

ActionView::Helpers::InstanceTag.send(:include, Gaigo::FormHelperV3::InstanceTag)
ActionView::Helpers::FormBuilder.send(:include, Gaigo::FormHelperV3::FormBuilder)