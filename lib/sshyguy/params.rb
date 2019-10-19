# frozen_string_literal: true

module SshyGuy
  module Params
    def self.params
      @params ||= {}
    end

    def self.params=(val)
      @params = val
    end

    def self.reload_params!
      self.params = {}
    end
  end
end
