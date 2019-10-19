# frozen_string_literal: true

module SshyGuy
  class Menu
    def initialize; end

    def items
      @items ||= Server.all
    end
  end
end
