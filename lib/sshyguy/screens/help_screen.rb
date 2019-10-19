# frozen_string_literal: true

module SshyGuy
  module Screens
    class HelpScreen < Screen
      def show
        SshyGuy.log('HelpScreen initialized')
        selection = prompt.select('How can I help?') do |select|
          select.enum '.'
          select.choice('Edit config file', :edit)
          select.choice('Jk', :close)
          select.choice('Exit', :exit)
        end
        case selection
        when :edit
          SshyGuy.log('Selected :edit')
          system("#{SshyGuy.config.editor} #{SshyGuy.config_file}")
          exit
        when :exit
          SshyGuy.log('Selected :exit')
          puts 'Bye.'
          SshyGuy.log('Exiting program')
          exit
        when :close
          SshyGuy.log('Selected :close')
          SshyGuy.log('Closing window')

        end
      end
    end
  end
end
