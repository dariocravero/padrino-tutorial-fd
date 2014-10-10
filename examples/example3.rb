require 'padrino-tutorial/message'

class App < Padrino::Application
  register Padrino::Helpers

  set :space, [
    Message.new("Hi", "Ankita"),
    Message.new("Hi!", "Darío"),
    Message.new("How're things?", "Darío"),
    Message.new("Good, and you?", "Ankita"),
    Message.new("Good thanks :) Chat soon!", "Darío"),
    Message.new("Sure, bye!", "Ankita")
  ]

  helpers do
    def messages
      settings.space.map do |message|
        message.to_s
      end
    end
  end

  mime_type :spoken, 'plain/text'

  get :index, provides: [:spoken, :html] do
    case content_type
    when :spoken
      return messages.join "\n"
      break
    else
      return messages.join "<br>"
      break
    end
  end

  get '/new' do
    %Q{
  <form action='/' method='POST'>
    <textarea name=what></textarea>
    <input type=text name=who placeholder=Who />
    <input type=submit />
  </form>
  }
  end

  post '/' do
    settings.space << Message.new(params['what'], params['who'])
    redirect '/'
  end
end
