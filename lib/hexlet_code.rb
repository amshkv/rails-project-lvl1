# frozen_string_literal: true

require_relative 'hexlet_code/version'
module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Builder, 'hexlet_code/builder'
  autoload :Renderer, 'hexlet_code/renderer'

  def self.form_for(entity, **form_options)
    form = Builder.new(entity, form_options)
    yield form if block_given?
    builded_form = form.build
    Renderer.new(builded_form).render
  end
end
