# frozen_string_literal: true

require 'test_helper'
require 'support/models'

class TestHexletCode < Minitest::Test
  def test_without_block
    user = User.new

    form_without_url = HexletCode.form_for user
    assert form_without_url == '<form action="#" method="post"></form>'

    form_with_url = HexletCode.form_for user, url: '/users'
    assert form_with_url == '<form action="/users" method="post"></form>'
  end

  def test_with_block
    user = User.new name: 'rob'
    resulted_html = ['<form action="#" method="post">',
                     '<input name="name" type="text" value="rob">',
                     '<input name="job" type="text" value="">',
                     '</form>'].join

    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
    end
    assert form == resulted_html
  end

  def test_with_options
    user = User.new name: 'rob', job: 'hexlet'
    resulted_html = ['<form action="#" method="post">',
                     '<input name="name" type="text" value="rob" class="lala-jopa">',
                     '<textarea name="job" cols="20" rows="10">hexlet</textarea>',
                     '</form>'].join

    form = HexletCode.form_for user do |f|
      f.input :name, class: 'lala-jopa'
      f.input :job, as: :text, rows: 10
    end
    assert form == resulted_html
  end

  def test_submit_without_value
    user = User.new name: 'rob', job: 'hexlet'
    resulted_html = ['<form action="#" method="post">',
                     '<input name="name" type="text" value="rob" class="lala-jopa">',
                     '<textarea name="job" cols="20" rows="10">hexlet</textarea>',
                     '<input type="submit" value="Save">',
                     '</form>'].join

    form = HexletCode.form_for user do |f|
      f.input :name, class: 'lala-jopa'
      f.input :job, as: :text, rows: 10
      f.submit
    end
    assert form == resulted_html
  end

  def test_submit_with_value
    user = User.new name: 'rob', job: 'hexlet'
    resulted_html = ['<form action="#" method="post">',
                     '<input name="name" type="text" value="rob" class="lala-jopa">',
                     '<textarea name="job" cols="20" rows="10">hexlet</textarea>',
                     '<input type="submit" value="Wow">',
                     '</form>'].join

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
