module Gaigo
  
  module FormHelperV4
    module FormBuilder
      def ilabel(method, text = nil, options = {}, &block)
        @template.ilabel(@object_name, method, text, objectify_options(options), &block)
      end
    end
  end
  
end