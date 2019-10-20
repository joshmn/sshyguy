# frozen_string_literal: true

module SshyGuy
  module Servers
    def servers=(val)
      @servers = val
    end

    def servers
      @servers ||= []
    end
  end
end
