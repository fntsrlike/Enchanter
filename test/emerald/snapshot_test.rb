# frozen_string_literal: true

require 'test_helper'
require 'enchanter/emerald'

module Enchanter
  class EmeraldTest < Minitest::Test
    def test_stable_version
      filenames = [
        'CommandBlock-1.12.2.jar',
        'CommandBlock-1.12.jar',
        'CommandBlock-1.jar',
        'CommandBlock-1'
      ]

      filenames.each do |filename|
        assert_nil Emerald.snapshot(filename)
      end
    end

    def test_snapshot_with_different_cases
      filenames = [
        'CommandBlock-1.12.2-SNAPSHOT.jar',
        'CommandBlock-1.12.2-snapshot.jar',
        'CommandBlock-1.12.2-sNaPsHoT.jar'
      ]

      filenames.each do |filename|
        assert_nil Emerald.snapshot(filename)
      end
    end

    def test_snapshot_with_prelease_number1
      filename = 'CommandBlock-1.12.2-SNAPSHOT.1712.jar'
      assert_equal '1712', Emerald.snapshot(filename)
    end

    def test_snapshot_with_prelease_number2
      filename = 'CommandBlock-1.12.2-SNAPSHOT.1712.a1b2c3.jar'
      assert_equal '1712.a1b2c3', Emerald.snapshot(filename)
    end

    def test_snapshot_with_prelease_number3
      filename = 'CommandBlock-1.12.2-SNAPSHOT.a1b2c3.jar'
      assert_equal 'a1b2c3', Emerald.snapshot(filename)
    end
  end
end
