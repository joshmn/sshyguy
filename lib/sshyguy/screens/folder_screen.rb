# frozen_string_literal: true

module SshyGuy
  module Screens
    class FolderScreen < Screen
      def show
        selected = prompt.select('Select a folder') do |select|
          Server.folders.each do |folder|
            select.choice(folder)
          end
          select.choice('All servers', '__ALL')
        end
        SshyGuy.params[:folder] = selected
        MainScreen.show(options)
      end
    end
  end
end
