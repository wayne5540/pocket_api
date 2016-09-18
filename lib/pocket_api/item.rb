module PocketAPI
  class Item
    INTEGER_ATTRIBUTES = %w(favorite status word_count has_video has_image sort_id)
    BOOLEAN_ATTRIBUTES = %w(is_article is_index)
    TIME_ATTRIBUTES = %w(time_added time_updated time_read time_favorited)
    STRING_ATTRIBUTES = %w(item_id resolved_id given_url given_title resolved_title resolved_url excerpt)
    ALL_ATTRIBUTES = INTEGER_ATTRIBUTES | BOOLEAN_ATTRIBUTES | TIME_ATTRIBUTES | STRING_ATTRIBUTES

    def initialize(hash)
      ALL_ATTRIBUTES.each do |attr_name|
        self.class.send(:define_method, "#{attr_name}=".to_sym) do |val|
          instance_variable_set("@" + attr_name.to_s, val)
        end

        self.class.send(:define_method, attr_name.to_sym) do
          instance_variable_get("@" + attr_name.to_s)
        end

        self.send("#{attr_name}=".to_sym, normalize(attr_name, hash[attr_name]))
      end
    end

    def id
      item_id
    end

    private

    def normalize(name, value)
      case
      when value == nil
        nil
      when INTEGER_ATTRIBUTES.include?(name)
        value.to_i
      when BOOLEAN_ATTRIBUTES.include?(name)
        value.to_i == 1
      when TIME_ATTRIBUTES.include?(name)
        value.to_i == 0 ? nil : Time.at(value.to_i)
      else
        value
      end
    end
  end
end
