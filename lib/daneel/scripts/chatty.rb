require 'daneel/script'

module Daneel
  module Scripts
    class Chatty < Daneel::Script

      # TODO uncomment all the named things once we have users
      def receive(room, message)
        case message.text
        when /^(night|good ?night)(,?\s(all|every(body|one)))$/i
          room.say "goodnight"#, #{user.name}"
          return message.done!
        when /^(morning|good ?morning)(,?\s(all|every(body|one)))$/i
          room.say "good morning"#, #{user.name}"
          return message.done!
        end

        case message.command
        when nil
          # don't reply to things not addressed to the bot
        # when /^\s*$/
        #   # question questioners, exclaim at exclaimers, dot dotters
        #   message.body.match(/(\?|\!|\.)$/)
        #   room.say(person + $1.to_s)
        when /say\s+(.*)/
          room.say($1)
        when /^(hey|hi|hello|sup|howdy)/i
          # room.say("#{$1} #{person}")
          room.say("#{$1}")
        when /(^later|(?:good\s*)?bye)/i
          # room.say("#{$1} #{person}")
          room.say("#{$1}")
        when /you rock|awesome|cool|nice/i
          room.say [
            # "Thanks, #{person}, you're pretty cool yourself.",
            "I try.",
            # "Aw, shucks. Thanks, #{person}."
          ].sample
        when /(^|you|still)\s*there/i, /\byt\b/i
          room.say %w{Yup y}.sample
        when /(wake up|you awake)/i
          room.say("yo")
        when /thanks|thank you/i
          room.say ["No problem.", "np", "any time", "that's what I'm here for", "You're welcome."].sample
        when /^(good\s?night|(?:g')?night)$/i
          room.say [
            # "see you later, #{person}",
            # "later, #{person}",
            "night",
            "goodnight",
            "bye",
            "have a good night"
          ].sample
        when /^(see you(?: later)?)$/i
          room.say [
            # "see you later, #{person}",
            # "later, #{person}",
            "bye",
            "later",
            "see ya",
          ].sample
        when /^(?:get|grab|fetch|bring|need)(?: (.*?))?(?: (?:a|some))? coffee$/i
          person = $1
          if person =~ /(me|us)/
            person, do_they = "you", "do you"
          else
            do_they = "does #{person}"
          end

          room.say [
            "would #{person} like cream or sugar?",
            "how #{do_they} take it?",
            "coming right up",
            "It is by caffeine alone I set my mind in motion",
            "It is by the beans of Java that thoughts acquire speed",
            "The hands acquire shakes, the shakes become a warning",
            "It is by caffeine alone I set my mind in motion"
          ].sample
        else
          room.say [
            # "I have no idea what you're talking about, #{person}.",
            "eh?",
            "oh, interesting",
            # "say more, #{person}",
            # "#{person}, you do realize that you're talking to a bot with a very limited vocabulary, don't you?",
            # "Whatever, #{person}.",
            # TODO implement Bot#other_person
            # "#{bot.other_person(person)}, tell #{person} to leave me alone.",
            # "Not now, #{person}.",
            "brb crying",
            # "what do you think, #{person}?",
            "That's really something.",
            "but what can I do? I'm just a lowly bot",
            "I'll get some electrons on that right away",
            # "How do you feel when someone says '#{message.command}' to you, #{person}?"
          ].sample
        end
      end

    end
  end
end
