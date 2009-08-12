module Multiplay
  module WasChanged

    def self.included(base)
      base.send(:before_save, :store_changes)
      base.attribute_method_suffix '_was_changed?', '_before_save_was', '_before_save_change'
    end

    def store_changes
      @was_changed_attributes = @changed_attributes.nil? ? {} : @changed_attributes.clone
    end
    
    def was_changed?
      !@was_changed_attributes.empty?
    end
  
    def was_saved
      @was_changed_attributes.keys
    end

    def saved_changes
      was_saved.inject({}) { |h, attr| h[attr] = attribute_before_save_change(attr); h }
    end
      
    def attribute_was_changed? attr
      @was_changed_attributes.keys.include? attr
    end

    def attribute_before_save_was attr
      attribute_was_changed?(attr) ? @was_changed_attributes[attr] : __send__(attr)
    end

    def attribute_before_save_change attr
      [@was_changed_attributes[attr], __send__(attr)] if attribute_was_changed?(attr)
    end

  end
end

ActiveRecord::Base.send(:include, Multiplay::WasChanged)
