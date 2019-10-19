# frozen_string_literal: true

module SshyGuy
  class Server
    def self.all
      @all ||= []
    end

    def initialize(config)
      @config = config
      self.class.all << self
    end

    def to_label
      @config['label'] || @config['hostname']
    end

    def spawn
      SshyGuy.log("Spawning command #{command.to_command}")
      system(command.to_command)
      exit
    end

    def command
      @command ||= Command.new(@config)
    end

    def folder
      @config['folder'].presence || 'Default'
    end

    def shortcut
      @config['shortcut'].presence
    end

    def group
      @config['group'].presence || 'Default'
    end
  end
end
