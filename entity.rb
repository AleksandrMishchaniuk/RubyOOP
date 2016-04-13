require './data_manager.rb'

class Entity
  extend DataManager

  def self.inherited(subclass)
    subclass.class_eval do
      class_variable_set(:@@instances, [])
    end
  end

  class << self
    
    def instances
        class_variable_get(:@@instances)
    end

    def get_by_id(id)
      instances.find { |item| id.to_i == item.id }
    end
  end
end