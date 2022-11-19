# frozen_string_literal: true

module HexletCode
  module Components
    class Select < Base
      def tag
        Tag.build('select', name: @name, **@options.except(:collection)) do
          collection = normalize_collection(@options[:collection])
          if collection.any?
            options = generate_options(collection).join("\n\t\t")
            "\n\t\t#{options}\n\t"
          end
        end
      end

      private

      def normalize_collection(collection)
        first = collection.first
        return collection if first.is_a?(Array)
        return collection.map { |element| [element, element] } if first.is_a?(String) || first.is_a?(Symbol)

        []
      end

      def generate_options(collection)
        collection.map do |element|
          text, value = element
          if value == @value
            Tag.build('option', value:, selected: 'selected') { text }
          else
            Tag.build('option', value:) { text }
          end
        end
      end
    end
  end
end
