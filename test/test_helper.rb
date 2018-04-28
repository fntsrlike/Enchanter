# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'enchanter'

require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'

SimpleCov.start
Minitest::Reporters.use!
