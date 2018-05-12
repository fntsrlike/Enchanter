# frozen_string_literal: true

module Enchanter
  # To verify plugin files
  module Emerald

    VERSION_REX = /^((\d+)(\.\d+)?(\.\d+)?).*$/

    module_function

    def name(filename)
      filename.split(/[-.]/).first
    end

    def version(filename)
      filename = filename.delete_suffix('.jar')
      parts = filename.split('-')
      return nil if parts.length <= 1

      version = parts.at(1)
      return nil unless version.match?(VERSION_REX)

      valid_version = version.match(VERSION_REX).to_a.at(1)
      pad = 3 - valid_version.split('.').length
      valid_version + '.0' * pad
    end

    def snapshot(filename)
      # TODO
    end

    def snapshot?(filename)
      # TODO
    end
  end
end
