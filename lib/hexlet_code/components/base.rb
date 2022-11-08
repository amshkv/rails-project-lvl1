# frozen_string_literal: true

module HexletCode
  module Components
    class Base
      def initialize(component)
        @name = component[:name]
        @options = component[:options]
        @value = component[:value]
      end

      def tag
        raise NotImplementedError
      end

      def label
        Tag.build('label', for: @name) { @name.capitalize }
      end

      def render
        [label, tag].join("\n\t")
      end
    end
  end
end
