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
      @components << { name:, value:, type:, label: true, options: options.except(:as) }
    end

    def submit(value = 'Save', **options)
      @components << { value:, type: :submit, label: false, options: }
    end
  end
end
