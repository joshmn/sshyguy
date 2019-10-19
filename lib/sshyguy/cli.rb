# frozen_string_literal: true

require 'sshyguy/screen'
require 'sshyguy/screens/help_screen'
require 'sshyguy/screens/main_screen'
require 'sshyguy/screens/shortcut_screen'
require 'sshyguy/screens/folder_screen'

module SshyGuy
  class CLI
    def self.run
      options = {}
      OptionParser.new do |opts|
        opts.banner = 'Usage: sshyguy [options]'
        opts.on('-h', '--help', 'Help') do |_v|
          options[:help] = true
        end
        opts.on('-s', '--shortcut SHORTCUT', 'Shortcut') do |v|
          options[:shortcut] = v
        end
        opts.on('--install') do |_v|
          options[:install] = true
        end
        opts.on('-d', '--debug', 'Debug') do |_v|
          SshyGuy.config.debug = true
        end
      end.parse!
      new(options).run
    end

    attr_reader :options
    def initialize(options = {})
      @options = options
    end

    def run
      if options[:install]
        puts "Writing to #{SshyGuy.config_file}"
        File.open(SshyGuy.config_file, 'w+') { |f| f.puts(File.read('lib/data/example.json')) }
        exit
      end
      SshyGuy.log('Loading config')
      SshyGuy.load_config!
      if options[:help]
        Screens::HelpScreen.show(options)
      else
        Screens::MainScreen.show(options)
      end
    end
  end
end
