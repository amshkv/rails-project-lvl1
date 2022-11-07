# frozen_string_literal: true

module HexletCode
  module Components
    class Base
      attr_reader :name, :value, :options_without_as

      def initialize(component)
        @name = component[:name]
        options = component[:options]
        @value = component[:value]
        @options_without_as = options.except(:as)
      end

      def tag
        Tag.build('input', name:, type: 'text', value:, **@options_without_as)
      end

      def label
        Tag.build('label', for: name) { name.capitalize }
      end

      def render
        [label, tag].join("\n\t")
      end
    end
  end
end
