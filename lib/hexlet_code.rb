# frozen_string_literal: true

require_relative 'hexlet_code/version'
module HexletCode
  class Error < StandardError; end

  autoload :Tag, 'hexlet_code/tag'

  def self.form_for(entity, **options)
    url = options[:url] || '#'

    Tag.build('form', action: url, method: 'post')
  end
end
