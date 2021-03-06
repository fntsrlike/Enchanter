# frozen_string_literal: true

require 'test_helper'

class EnchanterTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Enchanter::VERSION
  end

  def test_it_does_something_useful
    assert_equal 'hello world', Enchanter.hi
  end
end
