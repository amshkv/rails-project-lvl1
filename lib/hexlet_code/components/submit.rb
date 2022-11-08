# frozen_string_literal: true

module HexletCode
  module Components
    class Submit < Base
      def tag
        Tag.build('input', type: 'submit', value: @value, **@options)
      end

      def render
        tag
      end
    end
  end
end
