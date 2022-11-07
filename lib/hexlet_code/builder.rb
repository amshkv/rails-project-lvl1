# frozen_string_literal: true

module HexletCode
  class Builder
    def initialize(entity, form_options)
      @entity = entity
      @form_options = form_options
      @components = []
    end

    def build
      {
        form_options: @form_options,
        components: @components
      }
    end

    def input(name, **options)
      value = @entity.public_send(name) || ''
      options_with_default_as = { as: :input }.merge(options)
      @components << { name:, value:, options: options_with_default_as }
    end

    def submit(value = 'Save', **options)
      options_with_default_as = { as: :submit }.merge(options)
      @components << { value:, options: options_with_default_as }
    end
  end
end
