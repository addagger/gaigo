require 'rails'

module Gaigo
  class Railtie < ::Rails::Railtie
    config.before_initialize do
      ActiveSupport.on_load :active_record do
        require 'gaigo/models/active_record_extension'
        include ActiveRecordExtension
      end
      ActiveSupport.on_load :action_view do
        require 'gaigo/helpers/action_view_extension'
        include ActionViewExtension
      end
    end

  end
end