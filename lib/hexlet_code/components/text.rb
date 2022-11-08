# frozen_string_literal: true

module HexletCode
  module Components
    class Text < Base
      def tag
        defaults = { cols: 20, rows: 40 }
        options_with_defaults = defaults.merge(@options)
        Tag.build('textarea', name: @name, **options_with_defaults) { @value }
      end
    end
  end
end
