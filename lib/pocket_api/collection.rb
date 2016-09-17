module PocketAPI
  class Collection
    include Enumerable
    attr_reader :klass
    attr_accessor :data

    def initialize(klass, hashes=[])
      @klass = klass
      @data = parse_hashes(hashes)
    end

    def each(&block)
      @data.each{ |o| block.call(o) }
    end

    def where(key_value)
      key, value = key_value.first

      raise InvalidAttributeError, "Invalid attribute: #{key}" unless @klass.method_defined? key.to_sym

      dup_select { |o| o.send(key) == value }
    end

    private

    def dup_select(&block)
      dup = self.dup
      dup.data = select(&block)
      dup
    end

    def parse_hashes(hashes)
      hashes.map { |hash| @klass.new(hash) }
    end
  end
end