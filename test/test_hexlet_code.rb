# frozen_string_literal: true

require 'test_helper'
require 'support/models'

class TestHexletCode < Minitest::Test
  def test_without_block
    user = User.new

    form_without_url = HexletCode.form_for user
    resulted_form_without_url = load_fixture('form_without_url.html')
    assert form_without_url == resulted_form_without_url

    form_with_url = HexletCode.form_for user, url: '/users'
    resulted_form_with_url = load_fixture('form_with_url.html')
    assert form_with_url == resulted_form_with_url

    form_with_url_and_class = HexletCode.form_for user, url: '/users', class: 'user-form'
    resulted_form_with_url_and_class = load_fixture('form_with_url_and_class.html')
    assert form_with_url_and_class == resulted_form_with_url_and_class
  end

  def test_with_block
    user = User.new name: 'rob'
    resulted_html = load_fixture('form_with_block.html')

    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
    end
    assert form == resulted_html
  end

  def test_with_options
    user = User.new name: 'rob', job: 'hexlet'
    resulted_html = load_fixture('form_with_options.html')

    form = HexletCode.form_for user do |f|
      f.input :name, class: 'lala-jopa'
      f.input :job, as: :text, rows: 10
    end
    assert form == resulted_html
  end

  def test_submit_without_value
    user = User.new name: 'rob', job: 'hexlet'
    resulted_html = load_fixture('form_without_submit_value.html')

    form = HexletCode.form_for user do |f|
      f.input :name, class: 'lala-jopa'
      f.input :job, as: :text, rows: 10
      f.submit
    end
    assert form == resulted_html
  end

  def test_submit_with_value
    user = User.new name: 'rob', job: 'hexlet'
    resulted_html = load_fixture('form_with_submit_value.html')

    form = HexletCode.form_for user do |f|
      f.input :name, class: 'lala-jopa'
      f.input :job, as: :text, rows: 10
      f.submit 'Wow'
    end
    assert form == resulted_html
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
end
