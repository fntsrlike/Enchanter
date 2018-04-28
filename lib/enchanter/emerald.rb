# frozen_string_literal: true

module Enchanter
  # To verify plugin files
  module Emerald
    module_function

    def name(filename)
      filename.split(/[-.]/).first
    end
  end
end
