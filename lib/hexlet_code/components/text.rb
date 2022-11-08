# frozen_string_literal: true

module HexletCode
  module Components
    class Text < Base
      def tag
        defaults = { cols: 20, rows: 40 }
        options = defaults.merge(@options_without_as)
        Tag.build('textarea', name: @name, **options) { @value }
      end
    end
  end
end
