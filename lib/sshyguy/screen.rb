# frozen_string_literal: true

module SshyGuy
  class Screen
    def self.show(options)
      new(options).show
    end

    attr_reader :prompt, :options
    def initialize(options)
      @options = options
      @prompt = Prompt.new
    end

    def show
      raise NotImplementedError
    end

    private

    def current_folder
      @current_folder ||= SshyGuy.params[:folder].presence
    end

    def current_folder?
      current_folder.present? && current_folder != '__ALL'
    end

    def params
      SshyGuy.params
    end
  end
end
