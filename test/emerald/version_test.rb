# frozen_string_literal: true

require 'test_helper'
require 'enchanter/emerald'

module Enchanter
  class EmeraldTest < Minitest::Test
    def test_semantic_version
      assert_equal '1.12.2', Emerald.version('CommandBlock-1.12.2.jar')
    end

    def test_semantic_version_without_patch
      assert_equal '1.12.0', Emerald.version('CommandBlock-1.12.jar')
    end

    def test_semantic_version_without_minor
      assert_equal '1.0.0', Emerald.version('CommandBlock-1.jar')
    end

    def test_semantic_version_with_more_number
      assert_equal '1.12.2', Emerald.version('CommandBlock-1.12.2.1.2.jar')
    end

    def test_semantic_version_with_alphabet
      assert_equal '1.12.2', Emerald.version('CommandBlock-1.12.2.ab.bcd.jar')
    end

    def test_semantic_version_with_prerealease_version
      filenames = [
        'CommandBlock-1.12.2-SNAPSHOT.jar',
        'CommandBlock-1.12.2-SNAPSHOT.a1b2c3.jar',
        'CommandBlock-1.12.2-SNAPSHOT.1804.a1b2c3.jar',
        'CommandBlock-1.12.2-1804.jar',
        'CommandBlock-1.12.2-a1b2c3.jar'
      ]

      filenames.each do |filename|
        assert_equal '1.12.2', Emerald.version(filename)
      end
    end

    def test_semantic_version_with_invalid_prerealease_version
      filenames = [
        'CommandBlock-1.12.2-SNAPSHOT-a1b2c3.jar',
        'CommandBlock-1.12.2-SNAPSHOT-1804-a1b2c3.jar'
      ]

      filenames.each do |filename|
        assert_equal '1.12.2', Emerald.version(filename)
      end
    end

    def test_without_version
      filenames = [
        'CommandBlock.jar',
        'CommandBlock-a1b2c3.jar',
        'CommandBlock-SNAPSHOT.a1b2c3.jar',
        'CommandBlock-SNAPSHOT.1804.a1b2c3.jar'
      ]

      filenames.each do |filename|
        assert_nil Emerald.version(filename)
      end
    end
  end
end
