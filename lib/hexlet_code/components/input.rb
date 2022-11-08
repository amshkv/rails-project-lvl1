# frozen_string_literal: true

module HexletCode
  module Components
    class Input < Base
      def tag
        Tag.build('input', name: @name, type: 'text', value: @value, **@options)
      end
    end
  end
end
