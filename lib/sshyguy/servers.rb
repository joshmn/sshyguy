# frozen_string_literal: true

module SshyGuy
  module Servers
    def self.servers=(val)
      @servers = val
    end

    def self.servers
      @servers ||= []
    end
  end
end
