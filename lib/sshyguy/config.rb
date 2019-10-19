# frozen_string_literal: true

module SshyGuy
  class Config
    attr_accessor :ssh_defaults, :debug, :include_shortcut, :cycle, :filter, :servers, :editor, :folders
    def cycle?
      cycle
    end

    def filter?
      filter
    end

    def debug?
      debug
    end
  end
end
