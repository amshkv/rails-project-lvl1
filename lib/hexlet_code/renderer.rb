# frozen_string_literal: true

require 'active_support/inflector'

module HexletCode
  autoload :Components, 'hexlet_code/components'

  class Renderer
    def initialize(builder)
      @builder = builder
    end

    def render
      form_options = @builder[:form_options]
      action = form_options[:url] || '#'
      form_options_with_defaults = form_options.except(:url).merge(action:, method: :post)
      Tag.build('form', **form_options_with_defaults) do
        components = @builder[:components]
        if components.any?
          result = components.map do |component|
            render_component(component)
          end.unshift('').join("\n\t")
          "#{result}\n"
        end
      end
    end

    def render_component(component)
      as_option = component[:options][:as]
      type = as_option.to_s.capitalize
      # NOTE: вариант без active_support
      # tag = Object.const_get("HexletCode::Components::#{type}").new(component).render
      element = "HexletCode::Components::#{type}".constantize.new(component)
      element.render
    end
  end
end
