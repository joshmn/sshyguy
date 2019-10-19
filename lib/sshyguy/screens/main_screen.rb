# frozen_string_literal: true

module SshyGuy
  module Screens
    class MainScreen < Screen
      def show
        SshyGuy.log('MainScreen initialized')
        ShortcutScreen.show(options) if options[:shortcut]
        SshyGuy.log('Building server menu')
        label = 'Select a server.'
        servers = SshyGuy::Server.all
        server = prompt.select(label) do |select|
          select.enum '.'
          servers.each do |item|
            select.choice(item.to_label, item)
          end
          select.choice('Exit folder', :close_folder) if current_folder?
        end
        SshyGuy.log("Selected #{server.inspect}")
        if server == :close_folder
          MainScreen.show(options)
        else
          SshyGuy.log("Spawning server #{server.inspect}")
          server.spawn
        end
      end
    end
  end
end