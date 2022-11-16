# frozen_string_literal: true

require 'active_support/inflector'

module HexletCode
  autoload :Components, 'hexlet_code/components'

  class Renderer
    def initialize(builder)
      @builder = builder
    end

    def render
      form_options = @builder.form_options
      action = form_options[:url] || '#'
      form_options_with_defaults = { action:, method: :post }.merge(form_options.except(:url))
      Tag.build('form', **form_options_with_defaults) do
        components = @builder.components
        if components.any?
          result = components.map do |component|
            render_component(component)
          end.join("\n\t")
          "\n\t#{result}\n"
        end
      end
    end

    def render_component(component)
      type = component[:type].to_s.capitalize
      # NOTE: вариант без active_support
      # element = Object.const_get("HexletCode::Components::#{type}").new(component).render
      element = "HexletCode::Components::#{type}".constantize.new(component)
      element.render
    end
  end
end
