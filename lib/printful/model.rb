module Printful
  class Model
    def self.attr_accessor(*vars)
      @attributes ||= []
      @attributes.concat(vars)
      super(*vars)
    end

    def self.attributes
      @attributes
    end

    def initialize(attributes = {})
      set_instance_variables_from_hash(attributes)
    end

    def attributes
      self.class.attributes
    end
    
    def as_json
      hash = {}
      attributes.each do |attribute|        
        value = instance_variable_get "@#{attribute}"
        if value.respond_to?(:as_json)
          value = value.as_json
        elsif value.respond_to?(:map)
          value = value.map { |item| item.respond_to?(:as_json) ? item.as_json : item }
        end
        hash[attribute] = value
      end
      hash
    end
    
    def to_json
      as_json.to_json
    end

    protected

    def copy_instance_variables_from_object(object)
      object.instance_variables.each do |ivar|
        instance_variable_set ivar, object.instance_variable_get(ivar)
      end
    end

    def set_instance_variables_from_hash(attributes)
      attributes.each do |key, value|
        instance_variable_set "@#{key}", value
      end
    end
  end
end
