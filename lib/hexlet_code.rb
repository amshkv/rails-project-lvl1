# frozen_string_literal: true

require_relative 'hexlet_code/version'
module HexletCode
  autoload :Tag, 'hexlet_code/tag'

  def self.form_for(entity, **options)
    @entity = entity
    url = options[:url] || '#'
    @inputs = []

    Tag.build('form', action: url, method: 'post') do
      if block_given?
        yield self
        @inputs.join
      end
    end
  end

  def self.input(name, **options)
    @inputs ||= []
    value = @entity.public_send(name) || ''
    @inputs << Tag.build('label', for: name) { name.capitalize }
    if options[:as] == :text
      options.delete(:as)
      defaults = { cols: 20, rows: 40 }
      options = defaults.merge!(options)
      @inputs << Tag.build('textarea', name:, **options) { value }
    else
      @inputs << Tag.build('input', name:, type: 'text', value:, **options)
    end
  end

  def self.submit(value = 'Save', **options)
    @inputs << Tag.build('input', type: 'submit', value:, **options)
  end
end
