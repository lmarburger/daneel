require 'daneel/message'
require 'daneel/plugin'
require 'daneel/room'
require 'daneel/user'

module Daneel
  class Adapter < Plugin

    def run
      # listen to rooms and dispatch messages to robot.receive
    end

    def say(room_id, message)
      # get the message into the room!
    end

    def announce(message)
      # say the message into every room the bot is in
    end

    def me
      @me ||= User.new(0, "R. Daneel Olivaw").tap do |me|
        me.short_name = "Daneel"
        me.initials = "DO"
      end
    end

    class << self
      def named(name)
        require File.join('daneel/adapters', name.downcase)
        adapter = Daneel::Adapters.const_get(name.capitalize)
        adapter || raise("Couldn't find Daneel::Adapters::#{a.capitalize}")
      end
    end

  end
end
