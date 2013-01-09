require 'gaigo/utilities'

module Gaigo

  module ActionViewExtension
    extend ActiveSupport::Concern

    include Utilities
  
    included do
      if Rails.version <= "3.2.8"
        require 'gaigo/helpers/form_helper_v3'
      else
        require 'gaigo/helpers/form_helper_v4'
      end
      include FormHelper
    end

    def render_with_locale(locale, *args, &block)
      I18n.with_locale locale do
        render(*args, &block)
      end
    end
    
  end
  
end
