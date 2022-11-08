# frozen_string_literal: true

module HexletCode
  module Components
    class Submit < Base
      def tag
        Tag.build('input', type: 'submit', value: @value, **@options)
      end
    end
  end
end
