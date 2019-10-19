# frozen_string_literal: true

module SshyGuy
  class Command
    attr_reader :to_command
    def initialize(config)
      @config = config
    end

    def to_command
      SshyGuy.log('Building command')
      SshyGuy.log(@config['command'])
      if @config['command'].present?
        @config['command']
      else
        parts = ['ssh']
        parts << @config['options'] if @config['options'].present?
        parts << "#{user}@#{hostname}"
        parts << "-p #{port}"
        parts.join(' ')
      end
    end

    %i[hostname user port options].each do |option|
      define_method(option) do
        @config[option.to_s].presence || SshyGuy.config.ssh_defaults[option.to_s]
      end
    end
  end
end
