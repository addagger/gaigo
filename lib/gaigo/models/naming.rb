require 'gaigo/models/naming/human_attribute_name'
require 'gaigo/models/naming/human_model_name'

module Gaigo

  module Naming
    ActiveModel::Name.send(:include, HumanModelName)
  end
  
end