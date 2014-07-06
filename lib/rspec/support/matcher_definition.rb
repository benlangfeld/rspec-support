module RSpec
  module Support
    def self.matcher_definitions
      @matcher_definitions ||= []
    end

    def self.register_matcher_definition(&block)
      matcher_definitions << block
    end

    def self.is_a_matcher?(object)
      matcher_definitions.any? { |md| md.call(object) }
    end

    # TODO: Move to rspec-expectations
    ::RSpec::Support.register_matcher_definition do |object|
      if defined?(RSpec::Matchers)
        ::RSpec::Matchers.is_a_matcher?(object)
      end
    end
  end
end
