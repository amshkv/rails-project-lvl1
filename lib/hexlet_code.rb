# frozen_string_literal: true

require_relative 'hexlet_code/version'
module HexletCode
  autoload :Tag, 'hexlet_code/tag'

  def self.form_for(entity, **options)
    @entity = entity
    action = options[:url] || '#'
    # TODO: разобраться как правильно собирать опции, чтобы не править тесты
    options_with_defaults = options.except(:url).merge(action:, method: :post)

    Tag.build('form', **options_with_defaults) do
      @inputs = []
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
      defaults = { cols: 20, rows: 40 }
      options_with_defaults = defaults.merge(options.except(:as))
      @inputs << Tag.build('textarea', name:, **options_with_defaults) { value }
    else
      @inputs << Tag.build('input', name:, type: 'text', value:, **options)
    end
  end

  def self.submit(value = 'Save', **options)
    @inputs << Tag.build('input', type: 'submit', value:, **options)
  end
end
