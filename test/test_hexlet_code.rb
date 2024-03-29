# frozen_string_literal: true

require 'test_helper'
require 'support/models'

class TestHexletCode < Minitest::Test
  def test_without_block
    user = User.new

    form_without_options = HexletCode.form_for user
    resulted_form_without_options = load_fixture('form_without_options.html')
    assert { form_without_options == resulted_form_without_options }

    form_with_options = HexletCode.form_for user, url: '/users', class: 'user-form', method: 'get'
    resulted_form_with_options = load_fixture('form_with_options.html')
    assert { form_with_options == resulted_form_with_options }
  end

  def test_with_block
    user = User.new name: 'rob'
    resulted_html = load_fixture('form_with_block.html')

    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
    end
    assert { form == resulted_html }
  end

  def test_with_block_options
    user = User.new name: 'rob', job: 'hexlet'
    resulted_html = load_fixture('form_with_block_options.html')

    form = HexletCode.form_for user do |f|
      f.input :name, class: 'lala-jopa', label: false
      f.input :job, as: :text, rows: 10, label: false
    end
    assert { form == resulted_html }
  end

  def test_submit_without_value
    user = User.new name: 'rob', job: 'hexlet'
    resulted_html = load_fixture('form_without_submit_value.html')

    form = HexletCode.form_for user do |f|
      f.input :name, class: 'lala-jopa'
      f.input :job, as: :text, rows: 10
      f.submit
    end
    assert { form == resulted_html }
  end

  def test_submit_with_value
    user = User.new name: 'rob', job: 'hexlet'
    resulted_html = load_fixture('form_with_submit_value.html')

    form = HexletCode.form_for user do |f|
      f.input :name, class: 'lala-jopa'
      f.input :job, as: :text, rows: 10
      f.submit 'Wow'
    end
    assert { form == resulted_html }
  end

  def test_form_without_field
    user = User.new
    assert_raises NoMethodError do
      HexletCode.form_for user do |f|
        f.input :name
        f.input :age
      end
    end
  end

  def test_form_with_select
    user = User.new job: 'hexlet'
    resulted_html = load_fixture('form_with_select.html')

    form_with_1d_collection = HexletCode.form_for user do |f|
      f.input :job, as: :select, collection: %w[hexlet code-basics]
      f.submit 'Wow'
    end

    form_with_2d_collection = HexletCode.form_for user do |f|
      f.input :job, as: :select, collection: [%w[hexlet hexlet], %w[code-basics code-basics]]
      f.submit 'Wow'
    end
    assert { form_with_1d_collection == resulted_html }
    assert { form_with_2d_collection == resulted_html }
  end
end
