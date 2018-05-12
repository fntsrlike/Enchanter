# frozen_string_literal: true

require 'test_helper'
require 'enchanter/emerald'

module Enchanter
  class EmeraldTest < Minitest::Test
    def test_with_big_camelcase
      assert_equal 'CommandBlock', Emerald.name('CommandBlock-1.12.2.jar')
    end

    def test_with_small_camelcase
      assert_equal 'commandBlock', Emerald.name('commandBlock-1.12.2.jar')
    end

    def test_with_underscore
      assert_equal 'command_block', Emerald.name('command_block-1.12.2.jar')
    end

    def test_with_snakecase
      assert_equal 'command', Emerald.name('command-block-1.12.2.jar')
    end

    def test_with_alphanumeric
      assert_equal 'CommandBlock2018',
                   Emerald.name('CommandBlock2018-1.12.2.jar')
    end

    def test_without_version
      assert_equal 'CommandBlock', Emerald.name('CommandBlock.jar')
    end

    def test_without_name
      assert_equal '', Emerald.name('-1.12.2.jar')
    end

    def test_without_extension_name
      assert_equal 'CommandBlock', Emerald.name('CommandBlock-1.12.2')
    end
  end
end
