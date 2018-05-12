# frozen_string_literal: true

module Enchanter
  # To verify plugin files
  module Emerald
    PLUGIN_NAME_REX = '([\w\d\-_]+)'
    VERSION_REX = '((\d+)(\.\d+)?(\.\d+)?)'
    SNAPSHOT_REX = 'SNAPSHOT(\.((\d{4}.\w{6})|(\w{6})|(\d{4})))?'

    module_function

    def name(filename)
      filename.split(/[-.]/).first
    end

    def version(filename)
      filename = filename.delete_suffix('.jar')
      parts = filename.split('-')
      return nil if parts.length <= 1

      version = parts.at(1)
      return nil unless version.match?(/^#{VERSION_REX}.*$/)

      valid_version = version.match(/^#{VERSION_REX}.*$/).to_a.at(1)
      pad = 3 - valid_version.split('.').length
      valid_version + '.0' * pad
    end

    def snapshot(filename)
      filename = filename.delete_suffix('.jar')
      parts = filename.split('-')
      return nil if parts.length < 3

      parts.at(2).slice(9..-1)
    end

    def snapshot?(filename)
      filename = filename.delete_suffix('.jar').downcase
      parts = filename.split('-')
      return false if parts.length <= 1

      parts.at(2).include?('snapshot')
    end

    def valid?(filename)
      filename.match?(/^#{PLUGIN_NAME_REX}(-#{VERSION_REX}(-#{SNAPSHOT_REX})?)?(.jar)?$/)
    end
  end
end
