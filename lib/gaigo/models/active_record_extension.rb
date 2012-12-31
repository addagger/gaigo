require 'gaigo/utilities'
require 'gaigo/has_locale'
require 'gaigo/models/naming'

module Gaigo

  module ActiveRecordExtension
    extend ActiveSupport::Concern
  
    module ClassMethods
      class_eval do
        include Gaigo::Utilities
        include Gaigo::HasLocale
      end
    end

    include Gaigo::Utilities
    include Gaigo::Naming::HumanAttributeName
  end

end
