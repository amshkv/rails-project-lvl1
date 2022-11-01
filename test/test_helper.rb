# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def load_fixture(filename)
  # TODO: временно поставил chomp, потом можно пересохранить файлы без переноса строки, а пока хз как правильно
  File.read(File.dirname(__FILE__) + "/fixtures/#{filename}").chomp
end
