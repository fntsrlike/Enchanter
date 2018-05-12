# frozen_string_literal: true

require 'test_helper'
require 'enchanter/emerald'

module Enchanter
  class EmeraldTest < Minitest::Test
    def test_stable_version
      filenames = [
        'CommandBlock',
        'CommandBlock-1.12.2.jar',
        'CommandBlock-1.12.jar',
        'CommandBlock-1.jar'
      ]

      filenames.each do |filename|
        assert_equal false, Emerald.snapshot?(filename)
      end
    end

    def test_snapshot_with_different_cases
      filenames = [
        'CommandBlock-1.12.2-SNAPSHOT.jar',
        'CommandBlock-1.12.2-snapshot.jar',
        'CommandBlock-1.12.2-sNaPsHoT.jar'
      ]

      filenames.each do |filename|
        assert_equal true, Emerald.snapshot?(filename)
      end
    end

    def test_snapshot_with_prelease_number
      filenames = [
        'CommandBlock-1.12.2-SNAPSHOT-1712.jar',
        'CommandBlock-1.12.2-SNAPSHOT-1712-a1b2c3.jar',
        'CommandBlock-1.12.2-SNAPSHOT-a1b2c3.jar'
      ]

      filenames.each do |filename|
        assert_equal true, Emerald.snapshot?(filename)
      end
    end
  end
end
