module PocketAPI
  class Item
    INTEGER_ATTRIBUTES = %w(favorite status word_count has_video has_image)
    BOOLEAN_ATTRIBUTES = %w(is_article is_index)
    TIME_ATTRIBUTES = %w(time_added time_updated time_read time_favorited)

    def initialize(hash)
      hash.each do |name, value|
        self.class.send(:define_method, "#{name}=".to_sym) do |val|
          instance_variable_set("@" + name.to_s, val)
        end

        self.class.send(:define_method, name.to_sym) do
          instance_variable_get("@" + name.to_s)
        end

        self.send("#{name}=".to_sym, normalize(name, value))
      end
    end

    def id
      item_id
    end

    private

    def normalize(name, value)
      case
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
