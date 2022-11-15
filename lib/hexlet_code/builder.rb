# frozen_string_literal: true

module HexletCode
  class Builder
    attr_reader :form_options, :components

    def initialize(entity, form_options)
      @entity = entity
      @form_options = form_options
      @components = []
    end

    def input(name, **options)
      value = @entity.public_send(name) || ''
      type = options[:as] || :input
      label = options.fetch(:label, true)
      @components << { name:, value:, type:, label:, options: options.except(:as, :label) }
    end

    def submit(value = 'Save', **options)
      label = options.fetch(:label, false)
      @components << { value:, type: :submit, label:, options: options.except(:label) }
    end
  end
end
