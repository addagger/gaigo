require "gaigo/version"

module Gaigo
  def self.load!
    load_langs!
    load_countries!
    i18n_extend!
    require 'gaigo/engine'
    require 'gaigo/railtie'
  end

  def self.load_langs!
    require 'gaigo/langs'
  end
  
  def self.load_countries!
    require 'gaigo/countries'
  end
  
  def self.i18n_extend!
    require 'gaigo/i18n_extend'
  end
  

end

Gaigo.load!