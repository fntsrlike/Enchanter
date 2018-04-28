# frozen_string_literal: true

require 'enchanter/version'

# The top level Dotenv module. The entrypoint for the application logic.
module Enchanter
  def self.hi(name = 'world')
    puts "Hello #{name}"
  end
end
