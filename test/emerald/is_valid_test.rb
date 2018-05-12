# frozen_string_literal: true

require 'test_helper'
require 'enchanter/emerald'

module Enchanter
  class EmeraldTest < Minitest::Test
    def test_valid_name
      filenames = [
        'CommandBlock',
        'CommandBlock.jar',
        'CommandBlock-1.jar',
        'CommandBlock-1.12.jar',
        'CommandBlock-1.12.2.jar',
        'CommandBlock-1.12.2-SNAPSHOT.jar',
        'CommandBlock-1.12.2-SNAPSHOT.1712.jar',
        'CommandBlock-1.12.2-SNAPSHOT.1712.a1b2c3.jar',
        'CommandBlock-1.12.2-SNAPSHOT.a1b2c3.jar'
      ]

      filenames.each do |filename|
        assert_equal true, Emerald.valid?(filename)
      end
    end

    def test_invalid_name
      filenames = [
        'CommandBlock-1.12.2.3.jar',
        'CommandBlock-1.12.2-SNAPSHOTa.jar',
        'CommandBlock-1.12.2-SNAPSHOT.17123.jar',
        'CommandBlock-1.12.2-SNAPSHOT.a1b2c3d4.jar'
      ]

      filenames.each do |filename|
        assert_equal false, Emerald.valid?(filename)
      end
    end
  end
end
