# frozen_string_literal: true

module SshyGuy
  def self.servers=(val)
    @servers = val
  end

  def self.servers
    @servers ||= []
  end
end
