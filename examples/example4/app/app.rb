require 'padrino-tutorial/message'

module Example
  class App < Padrino::Application
    enable :sessions
    register Padrino::Helpers

    set :space, [
      Message.new("Hi", "Ankita"),
      Message.new("Hi!", "Darío"),
      Message.new("How're things?", "Darío"),
      Message.new("Good, and you?", "Ankita"),
      Message.new("Good thanks :) Chat soon!", "Darío"),
      Message.new("Sure, bye!", "Ankita")
    ]

    mime_type :spoken, 'plain/text'
  end
end
