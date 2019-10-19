# frozen_string_literal: true

module SshyGuy
  module Screens
    class ShortcutScreen < Screen
      def show
        unless find_shortcut
          puts "No shortcut found for '#{options[:shortcut]}'"
          exit
        end
        find_shortcut.spawn
      end

      private

      def find_shortcut
        @find_shortcut ||= Server.all.detect { |item| item.shortcut == options[:shortcut] }
      end
    end
  end
end
