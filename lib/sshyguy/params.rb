# frozen_string_literal: true

module SshyGuy
  module Params
    def params
      @params ||= {}
    end

    def params=(val)
      @params = val
    end

    def reload_params!
      self.params = {}
    end
  end
end
