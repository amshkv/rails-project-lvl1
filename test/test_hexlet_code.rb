# frozen_string_literal: true

require 'test_helper'
require 'support/models'

class TestHexletCode < Minitest::Test
  def test_form_generate
    user = User.new name: 'rob'

    form_without_url = HexletCode.form_for user

    assert form_without_url == '<form action="#" method="post"></form>'

    form_with_url = HexletCode.form_for user, url: '/users'

    assert form_with_url == '<form action="/users" method="post"></form>'
  end
end
