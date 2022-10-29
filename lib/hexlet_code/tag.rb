# frozen_string_literal: true

module HexletCode
  module Tag
    ELEMENTS_WITHOUT_END_TAG = %w[img br hr input].freeze

    def self.build(tag, **options)
      attributes = options.map { |key, value| " #{key}=\"#{value}\"" }.join
      return "<#{tag}#{attributes}>" if ELEMENTS_WITHOUT_END_TAG.include?(tag)

      "<#{tag}#{attributes}>#{yield if block_given?}</#{tag}>"
    end
  end
end
