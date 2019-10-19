# frozen_string_literal: true

require 'sshyguy/version'
require 'tty-prompt'
require 'optionparser'
require 'json'
require 'sshyguy/params'
require 'sshyguy/servers'
require 'sshyguy/config'
require 'sshyguy/prompt'
require 'sshyguy/core_ext'
require 'sshyguy/menu'
require 'sshyguy/server'
require 'sshyguy/command'
require 'sshyguy/cli'

module SshyGuy
  extend SshyGuy::Servers
  extend SshyGuy::Params
  class Error < StandardError; end

  def self.configuration
    @configuration ||= Config.new
  end

  def self.config
    configuration
  end

  def self.log(str)
    if SshyGuy.config.debug?
      puts str
      puts caller(0)
    end
  end

  def self.config_file
    File.expand_path('~/.sshyguy.json')
  end

  def self.load_config!
    SshyGuy.log("Checking if config_file exists at #{config_file}")
    unless File.exist?(config_file)
      SshyGuy.log('config_file not found')
      puts "No config file found at #{config_file}"
      puts 'Install this with sshyguy --install'
      SshyGuy.log('Exiting program')
      exit
    end
    begin
      SshyGuy.log('Parsing config_file')
      file = File.read(config_file)
      SshyGuy.log('File read')
      SshyGuy.log('File contents:')
      SshyGuy.log(file)
      SshyGuy.log('Parsing file')
      json = JSON.parse(file)
      if json['version'].to_i < SshyGuy::CONFIG_VERSION
        puts 'Warning: Configuration out of date.'
      end
      SshyGuy.log('Parsed')
      SshyGuy.log('Parsed contents')
      SshyGuy.log(json)
      SshyGuy.log('Loading config defaults')
      json['config'].each do |k, v|
        SshyGuy.log("Setting default '#{k}' to '#{v}'")
        configuration.send("#{k}=", v)
      end
      json['servers'].each do |server|
        if server['command'].present? || server['hostname'].present?
          Server.new(server)
        else
          log("Skipping server #{server.inspect}")
        end
      end
    rescue JSON::ParserError => e
      puts e
      puts "Unable to parse config file. Ensure it's valid JSON."
      exit
    end
  end
end
