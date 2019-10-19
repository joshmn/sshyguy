# frozen_string_literal: true

module SshyGuy
  class Prompt < TTY::Prompt
    def select(question, *args, &block)
      super(question, *args, cycle: SshyGuy.config.cycle?, filter: SshyGuy.config.filter?, &block)
    end
  end
end
