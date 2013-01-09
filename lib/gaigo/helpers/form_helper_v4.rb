require 'gaigo/helpers/form_helper_v4/form_builder'
require 'gaigo/helpers/form_helper_v4/tags'

module Gaigo

  module FormHelper
    def ilabel(object_name, method, content_or_options = nil, options = nil, &block)
      Tags::ILabel.new(object_name, method, self, content_or_options, options).render(&block)
    end
  end
  
end

ActionView::Helpers::Tags.send(:include, Gaigo::FormHelperV4::Tags)
ActionView::Helpers::FormBuilder.send(:include, Gaigo::FormHelperV4::FormBuilder)