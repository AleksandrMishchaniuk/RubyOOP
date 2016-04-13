require './data_manager.rb'

class Entity
  extend DataManager

  def to_str(glue = ', ')
    arr = []
    self.instance_variables.each do |var|
      val = self.instance_variable_get(var)
      if val.is_a?(String) || val.is_a?(Integer)
        arr <<  val.to_s
      elsif !(val.is_a?(Hash) || val.is_a?(Array))
        arr <<  val.id.to_s
      end
    end
    arr * glue
  end

  class << self
    def inherited(subclass)
      subclass.class_eval do
        class_variable_set(:@@instances, [])
      end
    end
    
    def instances
        class_variable_get(:@@instances)
    end

    def get_by_id(id)
      instances.find { |item| id.to_i == item.id }
    end
  end
end